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

Imagine we want to know how far we should go to find a racoon.  
You first need to know a little bit about them, like where they live and what they like to eat.  
So you look them up and find a couple of information:  
Their mating season happens around January and lasts approximately two months, after which the female gives birth to her offspring (4-6 cubs).  
This is usually when you see groups of racoons, because they are mostly solitary when they are adults.  
When baby racoons are 10 months old they become independent and they start hunting their own food and choosing a new place to live.  
Their front legs are very sensitive, which is a very useful tool to discover what is on the menu when you have an **omnivorous** diet, which means they eat plants, insects, frogs, eggs and rodents (such as rats).  
With such a varied diet, they can take advantage of us, humans, because we are also omnivorous and we waste a lot of food.  
Thus, raccoons can have a feast only using what we throw in the garbage every day!  
Racoons are also great explorers! They are capable of running up to 15 miles per hour and of swimming, if necessary.  
The ideal home for a raccoon is usually a wooded area near to a water source, but any quiet place with food and water can be a den.  
All this information tell us a lot about where we have higher chances of finding a racoon: we can find them where there are trees, food (even garbage!) and water, and we can find more of them in the beggining of the year.

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

![Raccoon labyrinth](https://github.com/PoisotLab/ms_frontiers_kids/blob/master/images/Laberinto%20final%20.jpg)

You may have not realized, but your brain made a series of decisions very similar to those that computers make.  
Computers help us see life from the animal’s perspective, like you had to be in the raccoon's shoes to decide where to turn in each step of the labyrinth.  
What would be the most reasonable choice for a raccoon's everyday problems, like where to find food, water or a potential partner to have offspring with?  
However, because the world is changing, racoons will constantly be moving and adapting to new places, and having a common language with computers allow us to organize, to quantify and to understand what would be an ideal place to find a racoon now or in a near future.

Computers give us different kinds of numbers (like probabilities).  
According to the information we provided, they will calculate an unique number, between 0 and 1, for every place in the world.  
If this number is low, you might not be able to find a raccoon there.  
However, if this number is high, a raccoon might be hiding there somewhere.  
What's great with computers is that we can use these numbers to make beautiful maps!

We made one such map using three types of information: the  precise location where some raccoons have been observed in the past, the temperatures, and the total precipitations that were recorded at these locations.  
Our computer learned the suitable habitat for a raccoon, in terms of temperature and precipitation.  
Regions with a similar climate were given a high value and regions with an unsuitable climate were given a low value.  
Remember that regions with a high value, near 1, might contain a raccoon and that regions with a low value, near 0, might not contain any.  
Locate where you live in the world and see if it would be easy for you to find a racoon there!  
Help us validate our model by verifying if there is indeed a racoon where we said there might be!  
Does the map say there might be a racoon near your house but there’s no way to find a racoon there?  
In your opinion, how could we have made the map more realistic? 
