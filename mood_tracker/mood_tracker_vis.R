# Moodtracker experiment


library(tidyverse)
library(emojifont)
library(extrafont)
library(nord)
library(lubridate)



moods <- read.csv("mood_tracker/data/moods.csv") %>% 
  mutate(date = ymd(date),
         mood = as.character(mood),
         mood = parse_factor(mood, levels = c("angry", "ugh", "glum", "meh", "good", "great")),
         x = sample(x = (1:10), size = 30, replace = T),
         y = sample(x = (1:30), size = 30, replace = T),
         label = emoji('star')) %>% 
  select(-X)
 


moods %>% 
  ggplot(aes(x = date, y = mood, colour = mood, label = label)) +
  geom_text(family = "EmojiOne", size = 15) +
  theme_void() +
  theme(legend.position = "none",
        panel.background = element_rect(fill = "#2E3440", colour ="#2E3440" ),
        plot.background = element_rect(fill = "#2E3440"),
        plot.title = element_text(family = "Ink Free", colour = "#8FBCBB", size = 18, hjust = 0.5)) +
  scale_colour_nord(palette = "aurora") +
  labs (title = "A Mood Tracker")  