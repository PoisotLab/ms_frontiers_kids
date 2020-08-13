## PL_FFYM Experience
#### Contributors:

- Gracielle  
- Norma  
- Francis  

### Outline

    1. We want to know where species are  
    2. We can do that using our computers: you can find them from home!  
    3. Understand species requirements  
    4. How computers learn about species requirements  
    5. Our results  
    6. Take home message (we can find species using computers YAY)  


### Main text
Have you ever noticed how when we travel to a place far away, we stop seeing animals we usually see back home?  
Or when that biologist on TV goes to a place that is really far from where you live, she shows a lot of birds, mammals and plants you have never seen before?  
And how do we know where we can find those animals and plants?  

We could try to explore every corner on Earth and list all living things that are present in each spot. 
Scientists used to understand nature doing things like that, and we still want to know where all the living things are, but that was tremendous work to go all around the world sampling everything.  
It turns out that ecologists can now use computers to answer these questions without having to leave their labs, and you can do that too!  

Imagine we want to know how far we should go to find a racoon, but we first need to know a little bit about them, like where they live and what they like to eat.  
So you look them up and find a couple of information:  

Their mating season happens around January and lasts approximately two months, after which the female gives birth to her offspring (4-6 cubs).  
Then, when you see groups of racoons, it sure is a family taking a walk.  
At 10 months old, the baby racoons will be independent and will preffer to do thigs at their own way, hunting their own food and choosing a new place to live.  
But how do raccoons choose their den?  
Biologists discovered that raccoons usually select a wooded area near to a water source, but any quiet place with food and water can be a den.  
And what about the dinner?  
Their front legs are very sensitive, which is a very useful tool to discover what is on the menu when you have an **omnivorous** diet, which means they eat plants, insects, frogs, eggs and rodents (such as rats).  
With such a varied diet, they can take advantage of us, humans, because we are also omnivorous and we waste a lot of food.  
Thus, raccoons can have a feast only using what we throw in the garbage every day!  
Now imagine that there are biologists all around the world communicating this information; it is a large amount of data, right?  
But all this information tell us a lot about where we have higher chances of finding a racoon: we can find them where there are trees, food (even garbage!) and water, and we can find more of them in the beggining of the year.  
Here is when we need that computers help us to analyze the data and find the species.

When we ask computers to help us find raccoons, we share with them what we already know about those animals, and then computers understand how the environment should be in order to host a raccoon.  
Then we can show the computer a different environment, and it will tell us how likely it is that we find a raccoon there based ont he characteristics of this particular environment.  
Once a computer has learned all about what we told it, it will think for a while.  
But how do computers think?  
They use something we call **algorithm**, which is a sequence of orders it follows to reach an answer.  
For example, when we have to go outside, we have to decide what we should wear.  
So we gather some information, such as which clean clothes are available and if it’s raining or not.  
The following step would be to exclude options based on these information, using a sequence of statements: if it’s raining, we'll wear a jacket and boots; if it’s not raining, we’ll wear a t-shirt.  
If it’s raining, but the jacket is not clean… Well, you can either use a dirty jacket or stay home!

Computers can apply the same logic to our racoons problem: if it’s too cold and snowy, or too hot and dry, racoons will probably not be there.  
If there’s no food they can eat, they will probably not be there either.  
On the contrary, if there is a temperate forest, where the temperature is neither too cold nor too hot, and if there is enough clean water for them to drink, they might be present, hidden somewhere in the woods.  
They might also be present if there is a city or a village with lots of food for them to eat.  
Who wouldn't be attracted to this trash buffet?

Now let's try an experiment: let's find a raccoon together! 
Here are some tips that can help you to find it in the labyrinth below: first, remember the thigs that they usually love, like garbage. If you pass near (not over!) a garbage bin, you are getting close! Next, find a place with a tree where raccoons love to climb. Finally, look for a source or water. Good luck to find it! Oh, and, please, don’t touch it when you find it. They love to have privacy!  

![Raccoon labyrinth](https://github.com/PoisotLab/ms_frontiers_kids/blob/master/images/Laberinto%20final.jpg)

You may have not realized, but your brain made a series of decisions very similar to those that computers make.  
Computers help us see life from the animal’s perspective, like you had to be in the raccoon's shoes to decide where to turn in each step of the labyrinth.  
What would be the most reasonable choice for a raccoon's everyday problems, like where to find food, water or a potential partner to have offspring with?  

Computers give us different kinds of numbers (like probabilities).  
According to the information we provided, they will calculate an unique number, between 0 and 1, for every place in the world.  
If this number is low, you might not be able to find a raccoon there.  
However, if this number is high, a raccoon might be hiding there somewhere.  
What's great with computers is that we can use these numbers to make beautiful maps!

We made one such map using three types of information: the  precise location where some raccoons have been observed in the past, the temperatures, and the total precipitations that were recorded at these locations.  
Our first map looked like this:
![](https://github.com/PoisotLab/ms_frontiers_kids/blob/gd/map-emoji/fig/occurrences_emojis.png)

From this map, our computers learned about the characteristics of a suitable habitat for a raccoon, in terms of temperature and precipitation.  
Then we asked our computers to look in the whole world what are the chances that we find a raccoon in each place, and it thought really hard for a while...  
The computer then atributed values between 0 and 1 for each place, representing how high is the probability to find a raccoon there.  
Regions with a similar climate had a high value, but regions with an unsuitable climate had low values.  
Remember that regions with a high value, near 1, might contain a raccoon and that regions with a low value, near 0, might not contain any.  
The computer then answered our question with another map, like this one:
![](https://github.com/PoisotLab/ms_frontiers_kids/blob/gd/map-emoji/fig/predictions.png)

See? The computer help us find where we should go first if we need to find a raccoon!  
If the place has a high value, we should go there first because the chances are very high that we find a raccoon there.  
Notice that sometimes the computer says that we should go to places where raccoons knowingly are not.  
There are ways to help the computer avoid these mistakes, but this is why it is so important that humans validate computers' answers, and use them only to gide our searches.  
Because the world is changing, raccoons will constantly be moving and adapting to new places, making computers job even more valuable.  
Having a common language with computers allow us to organize, to quantify and to understand what would be an ideal place to find a racoon now, but also in a near future.    

Now it is your turn to be a scientist!  
Locate where you live in the world and see if it would be easy for you to find a racoon there.  
Help us validate our computer's answer by verifying if there is indeed a racoon where we said there might be!  
Does the map say there might be a racoon near your house but there’s no way to find a racoon there?  
In your opinion, how could we have made the map more realistic?

### Glosary:

**Species**: Comprising related organisms that share common characteristics and are capable of interbreeding.

**Algorithm**: An specific procedure for solving a well-defined computational problem.

**Life expectancy**: Estimate of the average number of additional years that a living being of a given age can expect to live.

**Probability**: Numerical measure of the likelihood that a particular event will occur.

### References: 

Louppe, V., Leroy, B., Herrel, A. et al. Current and future climatic regions favourable for a globally introduced wild carnivore, the raccoon Procyon lotor. Sci Rep 9, 9174 (2019). https://doi.org/10.1038/s41598-019-45713-y

Species Distribution Modelling: Contrasting presence-only models with plot abundance data; Gomes, V.H., IJff, S.D., Raes, N. et al. Species Distribution Modelling: Contrasting presence-only models with plot abundance data. Sci Rep 8, 1003 (2018). https://doi.org/10.1038/s41598-017-18927-1

Suzanne Prange, Stanley D. Gehrt, Ernie P. Wiggers, Influences of Anthropogenic Resources on Raccoon (Procyon lotor) Movements and Spatial Distribution, Journal of Mammalogy, Volume 85, Issue 3, June 2004, Pages 483–490, https://doi.org/10.1644/1383946


