#####################################
#title: make-shot-charts-script
#description: script to create charts of shot data
#input: player data frames
#output: plots of player shot statistics
#####################################

setwd("C:/Users/Lucas Liu/stat133/hw-stat133/workout01")

library(ggplot2)
library(jpeg)
library(grid)

court_file <- 'images/nba-court.jpg'
court_image <- rasterGrob(
  readJPEG(court_file), 
  width = unit(1, "npc"), 
  height = unit(1, "npc"))

andre_shot_chart <- ggplot(data = andre) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Andre Iguodala (2016 season)') + 
  theme_minimal()
ggsave("images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
draymond_shot_chart <- ggplot(data = draymond) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Draymond Green (2016 season)') + 
  theme_minimal()
ggsave("images/draymond-green-shot-chart.pdf", width=6.5, height=5)
kevin_shot_chart <- ggplot(data = kevin) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Kevin Durant (2016 season)') + 
  theme_minimal()
ggsave("images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
klay_shot_chart <- ggplot(data = klay) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Klay Thompson (2016 season)') + 
  theme_minimal()
ggsave("images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
stephen_shot_chart <- ggplot(data = stephen) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) + ggtitle('Shot Chart: Stephen Curry (2016 season)') + 
  theme_minimal()
ggsave("images/stephen-curry-shot-chart.pdf", width=6.5, height=5)

allplayers_chart <- ggplot(data=allplayers) +
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  facet_wrap(~ name) +
  ylim(-50, 420) + ggtitle('Shot Charts: GSW (2016 season)') + 
  theme_minimal()
ggsave("images/gsw-shot-charts.pdf", width=8, height=7)
ggsave("images/gsw-shot-charts.png", width=8, height=7)
