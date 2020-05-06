import Pkg
Pkg.activate(".")

using GBIF
using SimpleSDMLayers
using StatsBase
using Plots

## Get occurrences & climatic data

# Get the GBIF taxon
raccoon = GBIF.taxon("Procyon lotor", rank=:SPECIES, strict=true)

# Get the initial occurrences
raccoon_occ = GBIF.occurrences(raccoon, "limit" => 100)

# Get the rest of the occurrences
while length(raccoon_occ) <= 2000
    try
        GBIF.occurrences!(raccoon_occ)
    catch#
        break
    end
end

# Hide the occurrences who do not match quality
filter!(GBIF.have_ok_coordinates, raccoon_occ)
length(raccoon_occ)

# Get the temperature and precipitation
temperature = clip(SimpleSDMLayers.worldclim(1), raccoon_occ)
precipitation = clip(SimpleSDMLayers.worldclim(12), raccoon_occ)

# Map raccoon occurrences
temp_map = heatmap(temperature, c = :inferno, xlab= "Longitude", ylab = "Latitude",
                   colorbar_title = "Temperature (° C)", dpi = 150)
prec_map = heatmap(precipitation, c = :blues, xlab= "Longitude", ylab = "Latitude",
                   colorbar_title = "Precipitation (mm)", dpi = 150)
occ_map  = heatmap(temperature, c = :lightgrey, xlab= "Longitude", ylab = "Latitude",
                   colorbar = :none, dpi = 150)
scatter!(occ_map, longitudes(raccoon_occ), latitudes(raccoon_occ),
         lab = "Raccoons", legend = :bottomright)

# Extract the values of the layers at the positions
histogram(temperature[raccoon_occ])
histogram(precipitation[raccoon_occ])

## Bioclim model
function _bioclim_score(x::Number)
    if isnan(x)
        return NaN
    end
    @assert 0. ≤ x ≤ 1.
    if x ≥ 0.5
        return 2(1-x)
    else
        return 2x
    end
end

function bioclim(layer::T, records::GBIFRecords) where {T <: SimpleSDMLayer}
    bioclim_prediction = similar(layer)
    qf = StatsBase.ecdf(filter(!isnan, layer[records]))
    bioclim_prediction.grid = _bioclim_score.(qf.(layer.grid))
    return bioclim_prediction
end

# Get prediction for each variable
temp_pred = bioclim(temperature, raccoon_occ)
prec_pred = bioclim(precipitation, raccoon_occ)

function Base.min(l1::T, l2::T) where {T <: SimpleSDMLayer}
    SimpleSDMLayers._layers_are_compatible(l1, l2)
    min_layer = similar(l1)
    for i in eachindex(l1.grid)
        if !isnan(l1[i])
            min_layer[i] = min(l1[i], l2[i])
        end
    end
    return min_layer
end

# Get minimum prediction per site
sdm_raccoon = min(temp_pred, prec_pred)

# Set value to NaN if prediction is zero
replace!(x -> iszero(x) ? NaN : x, sdm_raccoon.grid)

# Filter predictions with threshold
threshold = quantile(filter(!isnan, sdm_raccoon.grid), 0.05)
replace!(x -> x <= threshold ? NaN : x, sdm_raccoon.grid)

# Map predictions
pred_map = heatmap(temperature, c = :lightgrey, xlab= "Longitude", ylab = "Latitude", dpi = 150)
heatmap!(pred_map, sdm_raccoon, c = :viridis, clim = (0,1), colorbar_title = "Probability of seeing a raccoon")

## Export figures
savefig(temp_map, joinpath("fig", "temperature.png"))
savefig(prec_map, joinpath("fig", "precipitation.png"))
savefig(occ_map,  joinpath("fig", "occurrences.png"))
savefig(pred_map, joinpath("fig", "predictions.png"))
