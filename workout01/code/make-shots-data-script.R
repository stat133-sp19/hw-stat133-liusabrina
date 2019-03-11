# title: Data Preparation
# description: Cleans and combines data for the five NBA players
# input(s): one table of shots data for each of the five NBA players
# output(s): one summary table for each of the five NBA players and a combined summary table of the five players together

iguodala = read.csv("data/andre-iguodala.csv")
green = read.csv("data/draymond-green.csv")
durant = read.csv("data/kevin-durant.csv")
klay = read.csv("data/klay-thompson.csv")
curry = read.csv("data/stephen-curry.csv")

iguodala$name = "Andre Iguodala"
green$name = "Draymond Green"
durant$name = "Kevin Durant"
klay$name = "Klay Thompson"
curry$name = "Stephen Curry"

iguodala$shot_made_flag = c('shot_no', 'shot_yes')[iguodala$shot_made_flag]
green$shot_made_flag = c('shot_no', 'shot_yes')[green$shot_made_flag]
durant$shot_made_flag = c('shot_no', 'shot_yes')[durant$shot_made_flag]
klay$shot_made_flag = c('shot_no', 'shot_yes')[klay$shot_made_flag]
curry$shot_made_flag = c('shot_no', 'shot_yes')[curry$shot_made_flag]

iguodala$minute = iguodala$period * 12 - iguodala$minutes_remaining
green$minute = green$period * 12 - green$minutes_remaining
durant$minute = durant$period * 12 - durant$minutes_remaining
klay$minute = klay$period * 12 - klay$minutes_remaining
curry$minute = curry$period * 12 - curry$minutes_remaining

sink(file='output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file='output/draymond-green-summary.txt')
summary(green)
sink()

sink(file='output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file='output/klay-thompson-summary.txt')
summary(klay)
sink()

sink(file='output/stephen-curry-summary.txt')
summary(curry)
sink()

shots_data = rbind(iguodala,green,durant,klay,curry)

write.csv(x=shots_data, file='data/shots-data.csv')

sink(file='output/shots-data-summary.txt')
summary(shots_data)
sink()