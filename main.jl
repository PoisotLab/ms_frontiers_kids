import Pkg
Pkg.activate(".")

using GBIF
using SimpleSDMLayers
using StatsBase
using Plots
using ArchGDAL
using Images
using StatsPlots.PlotMeasures
using ProgressMeter

include("bioclim.jl")
include("landcover.jl")

# Load raccoon emoji
img = load("images/raccoon_freepik_cropped.png")

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

# Get the temperature and precipitation
temperature   = worldclim(1)[(bottom = -60.0)]
precipitation = worldclim(12)[(bottom = -60.0)]
# Get landcover data
tree  = landcover(1)[(bottom = -60.0)]
urban = landcover(2)[(bottom = -60.0)]
water = landcover(3)[(bottom = -60.0)]
# Combine variables
vars = [temperature, precipitation, tree, urban, water]

# Map climate variables
temp_map = heatmap(temperature, c = :inferno, xlab= "Longitude", ylab = "Latitude",
                   colorbar_title = "Temperature (° C)")
prec_map = heatmap(precipitation, c = :blues, xlab= "Longitude", ylab = "Latitude",
                   colorbar_title = "Precipitation (mm)")

# Map raccoon occurrences
# Option 1: Regular markers & raccoon emoji on the side
occ_map  = heatmap(temperature, c = :lightgrey, xlab= "Longitude", ylab = "Latitude",
                   colorbar = :none) |> x -> 
    scatter!(x, longitudes(raccoon_occ), latitudes(raccoon_occ),
         lab = "Raccoons", 
         legend = :outerbottomright,
         foreground_color_legend = nothing, 
         size = (600, 400)
    ) |> x ->
    plot!(x, img, 
        yflip = true,
        inset = bbox(0.4, -0.05, 150px, 75px, :center),
        subplot = 2,
        grid = false, axis = false,
        bg_inside = nothing
    )
# Option 2: Raccoon emojis as markers
occ_map2 = heatmap(temperature, c = :lightgrey, # xlab= "Longitude", ylab = "Latitude",
    colorbar = :none, size = (360,150).*2, 
    ticks = false, margin = -1.9mm)
n_emoji = 1:200
@time @showprogress for (lon, lat, i) in zip(longitudes(raccoon_occ)[n_emoji], latitudes(raccoon_occ)[n_emoji], n_emoji)
    plot!(occ_map2, img, yflip = true, grid = false, axis = false, bg_inside = nothing,
        inset = (1, bbox(((lon + 180)/360)w - 20px, ((lat+60)/150)h - 10px, 40px, 20px, :bottom, :left)),
        subplot = i+1
    )
end # ~ 4 minutes
occ_map2

## Bioclim model

# Get prediction for each variable
vars_predictions = bioclim.(vars, raccoon_occ)

# Get minimum prediction per site
sdm_raccoon = reduce(min, vars_predictions)

# Set value to NaN if prediction is zero
replace!(x -> iszero(x) ? NaN : x, sdm_raccoon.grid)

# Filter predictions with threshold
threshold = quantile(filter(!isnan, sdm_raccoon.grid), 0.05)
replace!(x -> x <= threshold ? NaN : x, sdm_raccoon.grid)

# Group predictions in categories
lim1 = 0.20
lim2 = 0.60
replace!(x -> x <= lim1 ? 0.0 : x, sdm_raccoon.grid)
replace!(x -> lim1 < x < lim2 ? 0.5 : x, sdm_raccoon.grid)
replace!(x -> x >= lim2 ? 1.0 : x, sdm_raccoon.grid)

# Custom colorpicking function
colorpick(cg::ColorGradient, n::Int) = RGB[cg[i] for i in LinRange(0, 1, n)]

# Map predictions
pred_map = heatmap(temperature, c = :lightgrey, colorbar = :none,
                   xlab= "Longitude", ylab = "Latitude",
                   framestyle = :box, size = (600, 300))
heatmap!(pred_map, sdm_raccoon, c = :viridis, clim = (0,1), colorbar_title = "Suitability for raccoons")
scatter!(pred_map, [NaN NaN NaN NaN],
             c = [colorpick(cgrad(:viridis), 3)... :lightgrey],
             labels = ["Low" "Medium" "High" "Not suitable"],
             legend = :outerbottomright, legendtitle = "Suitability",
             foreground_color_legend = nothing,
             legendtitlefontsize = 10)
plot!(pred_map, img, 
        yflip = true,
        inset = bbox(0.37, -0.22, 200px, 100px, :center),
        subplot = 2,
        grid = false, axis = false,
        bg_inside = nothing
    )

## Export figures
savefig(plot(temp_map, dpi = 150), joinpath("fig", "temperature.png"))
savefig(plot(prec_map, dpi = 150), joinpath("fig", "precipitation.png"))
savefig(plot(occ_map,  dpi = 150), joinpath("fig", "occurrences.png"))
savefig(plot(occ_map2, dpi = 150), joinpath("fig", "occurrences_emojis.png"))
savefig(plot(pred_map, dpi = 150), joinpath("fig", "predictions.png"))
