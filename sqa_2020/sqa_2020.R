# SQA 2020 Results



library(tidyverse)
library(lubridate)
library(nord)
library(extrafont)


sqa <- tibble(simd20 = c(68.6, 68.2, 68.2, 65.3, 69.9, 85.1),
              simd40 = c(72.7, 71.9, 71.3, 68.3, 73.8, 86.3),
              simd60 = c(75.8, 75.0, 74.7, 73.4, 77.3, 88.2),
              simd80 = c(79.1, 78.8, 78.9, 76.9, 80.6, 89.6),
              simd100 = c(83.2, 83.9, 83.5, 81.7, 84.6, 91.5),
              year = c(2016, 2017, 2018, 2019, 2020, 2020),
              results = c("act", "act", "act", "act", "act", "est")) %>% 
  pivot_longer(cols = c(simd20:simd100), names_to = "simcat", values_to = "highers_ac") %>% 
  group_by(results, simcat) %>% 
  mutate(sd = sd (highers_ac),
         simcat = parse_factor(simcat, levels = c("simd20", "simd40", "simd60", "simd80", "simd100"))) %>% 
  ungroup()


sqa %>% 
  ggplot(aes(x = year, y = highers_ac, colour = simcat)) +
  geom_ribbon(aes(ymin = highers_ac-sd, ymax = highers_ac+sd, fill = simcat), alpha = .3, colour = NA) +
  geom_line(aes(x= year, y = highers_ac + sd, colour = simcat), linetype = 2) +
  geom_line(aes(x= year, y = highers_ac - sd, colour = simcat), linetype = 2) +
  geom_point(aes(x = year, y = highers_ac, colour = simcat, shape = results), size = 6) +
  theme_classic() +
  scale_colour_nord(palette = "aurora", reverse = T) +
  scale_fill_nord(palette = "aurora", reverse = F) +
  labs(x = "Year of Award",
       y = "Percentage Students +/- SD",
       title = "Proportion of grades A-C at Higher by Scottish Index of Multiple Deprivation",
       subtitle = "Data from SQA Table A13, per Aamer Anwar Tweet",
       fill = "SIMD",
       colour = "SIMD",
       shape = "Actual vs Estimated") +
  theme (panel.background = element_rect(fill = "ghostwhite", colour ="ghostwhite" ),
         plot.background = element_rect(fill = "ghostwhite"),
         legend.background = element_blank(),
         text=element_text(family="Calibri Light")) +
  annotate("text", label = "https://github.com/jillymackay/ggplotexperiements/sqa_2020", 
           x = 2019, y = 60, size = 3, colour = "#486090", family = "Calibri Light" ) 
