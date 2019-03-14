Workout 1
================
Lucas Liu
March 12, 2019

<img src="C:/Users/Lucas Liu/stat133/hw-stat133/workout01/images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

``` r
shots <- read.csv("C:/Users/Lucas Liu/stat133/hw-stat133/workout01/data/shots-data.csv", stringsAsFactors = FALSE)
andre <- filter(shots, name=='Andre Iguodala')
draymond <- filter(shots, name=='Draymond Green')
kevin <- filter(shots, name=='Kevin Durant')
klay <- filter(shots, name=='Klay Thompson')
stephen <- filter(shots, name=='Stephen Curry')

#######################################################

andre_2pt <- filter(andre, shot_type=='2PT Field Goal')
andre_total_2pt <- nrow(andre_2pt)
andre_made_2pt <- nrow(filter(andre_2pt, shot_made_flag=='shot_yes'))
andre_perc_2pt <- andre_made_2pt / andre_total_2pt

draymond_2pt <- filter(draymond, shot_type=='2PT Field Goal')
draymond_total_2pt <- nrow(draymond_2pt)
draymond_made_2pt <- nrow(filter(draymond_2pt, shot_made_flag=='shot_yes'))
draymond_perc_2pt <- draymond_made_2pt / draymond_total_2pt

kevin_2pt <- filter(kevin, shot_type=='2PT Field Goal')
kevin_total_2pt <- nrow(kevin_2pt)
kevin_made_2pt <- nrow(filter(kevin_2pt, shot_made_flag=='shot_yes'))
kevin_perc_2pt <- kevin_made_2pt / kevin_total_2pt

klay_2pt <- filter(klay, shot_type=='2PT Field Goal')
klay_total_2pt <- nrow(klay_2pt)
klay_made_2pt <- nrow(filter(klay_2pt, shot_made_flag=='shot_yes'))
klay_perc_2pt <- klay_made_2pt / klay_total_2pt

stephen_2pt <- filter(stephen, shot_type=='2PT Field Goal')
stephen_total_2pt <- nrow(stephen_2pt)
stephen_made_2pt <- nrow(filter(stephen_2pt, shot_made_flag=='shot_yes'))
stephen_perc_2pt <- stephen_made_2pt / stephen_total_2pt

#######################################################

andre_3pt <- filter(andre, shot_type=='3PT Field Goal')
andre_total_3pt <- nrow(andre_3pt)
andre_made_3pt <- nrow(filter(andre_3pt, shot_made_flag=='shot_yes'))
andre_perc_3pt <- andre_made_3pt / andre_total_3pt

draymond_3pt <- filter(draymond, shot_type=='3PT Field Goal')
draymond_total_3pt <- nrow(draymond_3pt)
draymond_made_3pt <- nrow(filter(draymond_3pt, shot_made_flag=='shot_yes'))
draymond_perc_3pt <- draymond_made_3pt / draymond_total_3pt

kevin_3pt <- filter(kevin, shot_type=='3PT Field Goal')
kevin_total_3pt <- nrow(kevin_3pt)
kevin_made_3pt <- nrow(filter(kevin_3pt, shot_made_flag=='shot_yes'))
kevin_perc_3pt <- kevin_made_3pt / kevin_total_3pt

klay_3pt <- filter(klay, shot_type=='3PT Field Goal')
klay_total_3pt <- nrow(klay_3pt)
klay_made_3pt <- nrow(filter(klay_3pt, shot_made_flag=='shot_yes'))
klay_perc_3pt <- klay_made_3pt / klay_total_3pt

stephen_3pt <- filter(stephen, shot_type=='3PT Field Goal')
stephen_total_3pt <- nrow(stephen_3pt)
stephen_made_3pt <- nrow(filter(stephen_3pt, shot_made_flag=='shot_yes'))
stephen_perc_3pt <- stephen_made_3pt / stephen_total_3pt

#######################################################

andre_total_overall <- nrow(andre)
andre_made_overall <- nrow(filter(andre, shot_made_flag=='shot_yes'))
andre_perc_overall <- andre_made_overall / andre_total_overall

draymond_total_overall <- nrow(draymond)
draymond_made_overall <- nrow(filter(draymond, shot_made_flag=='shot_yes'))
draymond_perc_overall <- draymond_made_overall / draymond_total_overall

kevin_total_overall <- nrow(kevin)
kevin_made_overall <- nrow(filter(kevin, shot_made_flag=='shot_yes'))
kevin_perc_overall <- kevin_made_overall / kevin_total_overall

klay_total_overall <- nrow(klay)
klay_made_overall <- nrow(filter(klay, shot_made_flag=='shot_yes'))
klay_perc_overall <- klay_made_overall / klay_total_overall

stephen_total_overall <- nrow(stephen)
stephen_made_overall <- nrow(filter(stephen, shot_made_flag=='shot_yes'))
stephen_perc_overall <- stephen_made_overall / stephen_total_overall

#######################################################

andre_2pt_row <- c('Andre Iguodala', andre_total_2pt, andre_made_2pt, andre_perc_2pt)
draymond_2pt_row <- c('Draymond Green', draymond_total_2pt, draymond_made_2pt, draymond_perc_2pt)
kevin_2pt_row <- c('Kevin Durant', kevin_total_2pt, kevin_made_2pt, kevin_perc_2pt)
klay_2pt_row <- c('Klay Thompson', klay_total_2pt, klay_made_2pt, klay_perc_2pt)
stephen_2pt_row <- c('Stephen Curry', stephen_total_2pt, stephen_made_2pt, stephen_perc_2pt)

shoot_2pt <- data.frame("name" = c(andre_2pt_row[1], draymond_2pt_row[1], kevin_2pt_row[1], klay_2pt_row[1], stephen_2pt_row[1]),
                "total shots" = c(andre_2pt_row[2], draymond_2pt_row[2], kevin_2pt_row[2], klay_2pt_row[2], stephen_2pt_row[2]),
                "made shots" = c(andre_2pt_row[3], draymond_2pt_row[3], kevin_2pt_row[3], klay_2pt_row[3], stephen_2pt_row[3]),
                "percentage" = c(andre_2pt_row[4], draymond_2pt_row[4], kevin_2pt_row[4], klay_2pt_row[4], stephen_2pt_row[4]))
arrange(shoot_2pt, desc(percentage))
```

    ##             name total.shots made.shots        percentage
    ## 1 Andre Iguodala         210        134 0.638095238095238
    ## 2   Kevin Durant         643        390 0.606531881804043
    ## 3  Stephen Curry         563        304 0.539964476021314
    ## 4  Klay Thompson         640        329         0.5140625
    ## 5 Draymond Green         346        171 0.494219653179191

``` r
andre_3pt_row <- c('Andre Iguodala', andre_total_3pt, andre_made_3pt, andre_perc_3pt)
draymond_3pt_row <- c('Draymond Green', draymond_total_3pt, draymond_made_3pt, draymond_perc_3pt)
kevin_3pt_row <- c('Kevin Durant', kevin_total_3pt, kevin_made_3pt, kevin_perc_3pt)
klay_3pt_row <- c('Klay Thompson', klay_total_3pt, klay_made_3pt, klay_perc_3pt)
stephen_3pt_row <- c('Stephen Curry', stephen_total_3pt, stephen_made_3pt, stephen_perc_3pt)

shoot_3pt <- data.frame("name" = c(andre_3pt_row[1], draymond_3pt_row[1], kevin_3pt_row[1], klay_3pt_row[1], stephen_3pt_row[1]),
                "total shots" = c(andre_3pt_row[2], draymond_3pt_row[2], kevin_3pt_row[2], klay_3pt_row[2], stephen_3pt_row[2]),
                "made shots" = c(andre_3pt_row[3], draymond_3pt_row[3], kevin_3pt_row[3], klay_3pt_row[3], stephen_3pt_row[3]),
                "percentage" = c(andre_3pt_row[4], draymond_3pt_row[4], kevin_3pt_row[4], klay_3pt_row[4], stephen_3pt_row[4]))
arrange(shoot_3pt, desc(percentage))
```

    ##             name total.shots made.shots        percentage
    ## 1  Klay Thompson         580        246 0.424137931034483
    ## 2  Stephen Curry         687        280 0.407569141193595
    ## 3   Kevin Durant         272        105 0.386029411764706
    ## 4 Andre Iguodala         161         58 0.360248447204969
    ## 5 Draymond Green         232         74 0.318965517241379

``` r
andre_overall_row <- c('Andre Iguodala', andre_total_overall, andre_made_overall, andre_perc_overall)
draymond_overall_row <- c('Draymond Green', draymond_total_overall, draymond_made_overall, draymond_perc_overall)
kevin_overall_row <- c('Kevin Durant', kevin_total_overall, kevin_made_overall, kevin_perc_overall)
klay_overall_row <- c('Klay Thompson', klay_total_overall, klay_made_3pt, klay_perc_overall)
stephen_overall_row <- c('Stephen Curry', stephen_total_overall, stephen_made_overall, stephen_perc_overall)

shoot_overall <- data.frame("name" = c(andre_overall_row[1], draymond_overall_row[1], kevin_overall_row[1], klay_overall_row[1], stephen_overall_row[1]),
                "total shots" = c(andre_overall_row[2], draymond_overall_row[2], kevin_overall_row[2], klay_overall_row[2], stephen_overall_row[2]),
                "made shots" = c(andre_overall_row[3], draymond_overall_row[3], kevin_overall_row[3], klay_overall_row[3], stephen_overall_row[3]),
                "percentage" = c(andre_overall_row[4], draymond_overall_row[4], kevin_overall_row[4], klay_overall_row[4], stephen_overall_row[4]))
arrange(shoot_overall, desc(percentage))
```

    ##             name total.shots made.shots        percentage
    ## 1   Kevin Durant         915        495 0.540983606557377
    ## 2 Andre Iguodala         371        192 0.517520215633423
    ## 3  Klay Thompson        1220        246 0.471311475409836
    ## 4  Stephen Curry        1250        584            0.4672
    ## 5 Draymond Green         578        245 0.423875432525952

In this workout assignment, I used various techniques and tools that I learned throughout this class to visualize the shooting data of five basketball players. The purpose of this project was to gain experience using these visualization tools, and you can see the final data conclusions in the provided image at the top and the tables, where I plotted every shot that each player took and compared each player's shooting percentages with respect to 2 pointers, 3 pointers, and overall. The first step involved cleaning the data and preparing it for analysis; this onvolved adding necessary columns such as the name of each player, and making data values more descriptive such as changing "no" to "shot\_no". I extracted meaningful summaries from each player's statistics as well, which can be found in the output file. Next, I visualized the player's statistics using the useful ggplot2 tool, and those conclusions can be found in the images file. Finally, I compiled all of the players together to create the image at the top, and various tables with descending shooting percentages to see how each player measured up. My takeaway from this assignment was that it was a great way to get hands-on experience of useful data analysis tools!
