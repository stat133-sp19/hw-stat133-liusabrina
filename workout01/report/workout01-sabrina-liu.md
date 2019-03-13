Workout 1
================
Sabrina Liu

Top Secret Recipe for Dynasty Cake
==================================

### **Introduction**

You know them. The most energetic group of guys you will see on your television. The talk of the office on any given day. The inspiration of young kids worldwide. The most successful Bay Area professional sports team in recent past. The heroes we don't deserve. Of course, it's none other than the *Golden State Warriors*.

### **Motivation**

What makes this group of guys so great? What is it that they are doing time and time again? Clearly they have something good going for them as they have made it to the last four consecutive NBA finals and they have come away with three NBA Championship trophies. You may think there is nothing more these gladiators can achieve. But we begin to ask ourselves: Why have great when you can have the best? And better yet, why settle at the comparative best when you can have outright flawlessness? A few other teams in the league might be considered great; the Golden State Warriors might be considered the best, but how can we make them *flawless*?

### **Background**

To go forward, we must first step back. Let's take a look at the composition of this dream team. Who are the key players on this team? We've got:

-   Andre Iguodala \#9 (SF)
-   Draymond Green \#23 (PF)
-   Kevin Durant \#35 (PF)
-   Klay Thompson \#11 (SG)
-   Stephen Curry \#30 (PG)

Between the five of them, they have 47 years of experience in the NBA. That's a lot of years! They must have learned a thing or two in that time. To win games, the Warriors need to score points. To win as many games as the Warriors do, they need to score *a lot* of points in their allotted 48 minutes. We'll take a look at the breakdown of this data and see how each of these five superstars stack up against each other. We have the five essential ingredients but what's the perfect way to mix them to bake the perfect dynasty cake? What is the recipe for a 10-0 decade of championship rings?

<img src="../images/440057.png" width="80%" style="display: block; margin: auto;" />

### **Data**

You win championships by winning games. You win games by scoring points. You score points by shooting shots. At the root, we need to collect data on the shots these five players have taken. This data was taken from somewhere and compiled in the Stat 133 Github repository. Below we've made a map of shots each of our five players of interest have taken, with blue dots representing where successful shots began and red dots representing missed opportunities.

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

Some maps clearly have more dots than others, but we know quality is better than quantity. We see that Klay Thompson and Stephen Curry make the most shot attempts of the group. However, it is more important whether a shot was successful than how many overall shots were made, so below we have included a summary table that contains one row per player with the total number of shots they have taken, the number of shots they have made, and the percentage these two numbers reveal, which we will call the **Effective Shooting Percentage** for that player.

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <dbl> <dbl>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

We can break these percentages down further. Notice that on the shot maps the dots appear in clusters around a central arc. Shots from inside the arc are eligible for 2 points while shots from beyond the arc are eligible for 3 points. We are curious about the accuracy of each player from different distances on the court. Below are two summary charts for these different distances.

**2PT Effective Shooting Percentage by Player**

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <dbl> <dbl>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

**3PT Effective Shooting Percentage by Player**

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <dbl> <dbl>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

### **Analysis**

*Which players to play?*

The overall average percentage of shots made in the NBA is around 45%. Four of our five Warriors have percentages higher than that with Kevin Durant way ahead at 54%. You miss 100% of the shots you don't take, but it sure looks like the Warriors know how to shoot their shot. In terms of 3-point percentages, the same four are above the league average of 35% with Klay Thompson alone at the top with 42%. For 2-point percentages, Andre Iguodala's 63% success rate at the top is way ahead of Draymond Green's 49%. The lone player performing below average in these metrics is Draymond Green. Maybe he's a good defender--he is 6'7" after all. We also begin to wonder who gave Steph Curry two Season MVP awards since he neither leads in 2-point percentages nor 3-point percentages. We'll have to chew on our mouth guards a little and come back to that in our next article.

*Which shots to shoot?*

Are 2-pointers or 3-pointers more worthwhile? On the surface, we see that all the 3-point percentages are lower than the 2-point percentages, but this makes sense because they are arguably harder to make as they are farther distances away from the hoop. As a result, shots made from beyond the outer arc are eligible for more points. A crude measurement for a shot's value is to scale the percentages by their worth on the scoreboard. Multiplying each percentage by the number of points the shot would be worth gives us an average points per shot value for each player and each type of shot they can attempt.

| x    | Curry   | Durant  | Green   | Iguodala | Thompson |
|------|---------|---------|---------|----------|----------|
| 2-pt | 1.079   | *1.213* | *0.988* | *1.276*  | 1.028    |
| 3-pt | *1.222* | 1.158   | 0.956   | 1.080    | *1.272*  |

The italicized values indicate which type of shot is more worthwhile for each player. Steph Curry and Klay Thompson should spend their time trying for 3-pointers while the others should just dribble in closer to the hoop before shooting to maximize their expected points per shot.

### **Conclusion**

So new game plan: If the Warriors find themselves well-defended and outside the 3-point line, give the ball to Klay Thompson. If the Warriors are closing in for a layup, get the ball to Andre Iguodala. If they need to send someone in as a distraction for the opponents, send in Draymond Green and if he *has* to shoot the ball, he should go for a 2-pointer. As a smart head coach who believes in optimization, Steve Kerr should take this advice into account when leading his team. And maybe, *just maybe*, the Warriors will end up with a ring on each finger before we know it.

### **References**

-   <https://shottracker.com/articles/are-the-warriors-making-the-mid-range-relevant-again>
-   <https://www.basketball-reference.com/leagues/NBA_stats_per_game.html>
-   <https://www.basketball-reference.com/teams/GSW/2019.html>
-   <https://www.photosforclass.com/search/golden%20state%20warriors>
-   <https://www.landofbasketball.com/championships/year_by_year.htm>

### **Author's Note**

The author realizes that there are other metrics to analyze in order to holistically evaluate each player's worth to the team. However, due to limited time, minimal research, sleepiness, and lack of overall basketball knowledge, the author just went with what she had and this was the result. Steve Kerr should **not** read this article and should **not** follow these recommendations unless they are backed by real data scientists. The author would also like to apologize for angering anyone with brash statements that were just meant to grab attention. The author fully recognizes that Steph Curry deserves his current MVP awards and probably a few more after that too. We offer our most sincere apologies and offer Steph some baked goods that probably aren't as tasty as a perfect dynasty cake.
