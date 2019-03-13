# title: Shot Charts
# description: Produces shot maps for different players
# input(s): court image, one table of shot data for each of the five players, one table of shot data for all the players combined
# output(s): one pdf for each of the five players' shot charts, one pdf with the 5 shot charts together, one png with the 5 shot charts together

library(ggplot2)
library(jpeg)
library(grid)

court_file = "images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()

klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()

pdf(file='images/andre-iguodala-shot-chart.pdf', width=6.5, height=5)
iguodala_shot_chart
dev.off()

pdf(file='images/draymond-green-shot-chart.pdf', width=6.5, height=5)
green_shot_chart
dev.off()

pdf(file='images/kevin-durant-shot-chart.pdf', width=6.5, height=5)
durant_shot_chart
dev.off()

pdf(file='images/klay-thompson-shot-chart.pdf', width=6.5, height=5)
klay_shot_chart
dev.off()

pdf(file='images/stephen-curry-shot-chart.pdf', width=6.5, height=5)
curry_shot_chart
dev.off()

gsw_shot_charts = ggplot(shots_data, aes(x,y)) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal() + facet_wrap(~name)

pdf(file='images/gsw-shot-charts.pdf', width=8, height=7)
gsw_shot_charts
dev.off()

ggsave('images/gsw-shot-charts.png', width=8, height=7)