#####################################
#title: make-shots-data-script
#description: script to create data of shots
#input: csv files with player statistics
#output: summaries of each player
#####################################

setwd("C:/Users/Lucas Liu/stat133/hw-stat133/workout01")

library(dplyr)

andre <- read.csv("data/andre-iguodala.csv", stringsAsFactors = FALSE)
draymond <- read.csv("data/draymond-green.csv", stringsAsFactors = FALSE)
kevin <- read.csv("data/kevin-durant.csv", stringsAsFactors = FALSE)
klay <- read.csv("data/klay-thompson.csv", stringsAsFactors = FALSE)
stephen <- read.csv("data/stephen-curry.csv", stringsAsFactors = FALSE)

andre <- mutate(andre, name = 'Andre Iguodala')
draymond <- mutate(draymond, name = 'Draymond Green')
kevin <- mutate(kevin, name = 'Kevin Durant')
klay <- mutate(klay, name = 'Klay Thompson')
stephen <- mutate(stephen, name = 'Stephen Curry')

andre[andre=='n']<-'shot_no'
andre[andre=='y']<-'shot_yes'
draymond[draymond=='n']<-'shot_no'
draymond[draymond=='y']<-'shot_yes'
kevin[kevin=='n']<-'shot_no'
kevin[kevin=='y']<-'shot_yes'
klay[klay=='n']<-'shot_no'
klay[klay=='y']<-'shot_yes'
stephen[stephen=='n']<-'shot_no'
stephen[stephen=='y']<-'shot_yes'

mutate(andre, minute = period * 12 - minutes_remaining)
mutate(draymond, minute = period * 12 - minutes_remaining)
mutate(kevin, minute = period * 12 - minutes_remaining)
mutate(klay, minute = period * 12 - minutes_remaining)
mutate(stephen, minute = period * 12 - minutes_remaining)

sink(file='output/andre-iguodala-summary.txt')
summary(andre)
sink()
sink(file='output/draymond-green-summary.txt')
summary(draymond)
sink()
sink(file='output/kevin-durant-summary.txt')
summary(kevin)
sink()
sink(file='output/klay-thompson-summary.txt')
summary(klay)
sink()
sink(file='output/stephen-curry-summary.txt')
summary(stephen)
sink()

allplayers <- rbind(andre, draymond, kevin, klay, stephen)
write.csv(x=allplayers, file='data/shots-data.csv')
sink(file='output/shots-data-summary.txt')
summary(allplayers)
sink()
