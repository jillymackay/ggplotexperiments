# Visualising the reprex process
# Process stolen from https://stackoverflow.com/help/minimal-reproducible-example


library(tidyverse)
library(emojifont)
library(extrafont)



reprex <- tibble(x = c(50, 50, 0, 100, 50, 50, 0, 50),
                 y = c(100, 85, 70, 70, 50, 30, 20, 0),
                 label = c("Be Minimal",
                           "Use as little code as possible\nto reproduce the problem",
                           "Create a new file and add only what\nyou need to to reproduce the problem",
                           "Remove code bit by bit from your\nfile until you find what is working",
                           "Make sure your question is complete",
                           "The person trying to solve your problem\nshould be able to replicate it using\nyour code",
                           "Make sure to copy code as text-\ndon't use screenshots",
                           "Describe the problem again\nafter these steps. It may\nhave changed!"),
                 lvl = c("top", "sub", "side", "side", "top", "sub", "side", "top"))



reprex %>% 
  ggplot(aes(x = x, y = y)) +
  geom_text(aes(label = label, colour = lvl, family = "Constantia")) +
  theme_void() +
  scale_x_continuous(limits = c(-30,130))+
  scale_y_continuous(limits = c(-30, 130)) +
  theme(legend.position = "none",
        panel.background = element_blank(),
        plot.background = element_blank()) 
