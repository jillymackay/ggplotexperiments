# SoTL purpose

library(tidyverse)
library(nord)

set.seed(1986)

dat <- tibble(id = (1:100),
              score = sample(50:100, size =100, replace = TRUE)) %>% 
  mutate(grade = case_when((score <= 60) ~ "E",
                           (score >= 61 & score <=70) ~ "D",
                           (score >= 71 & score <= 80) ~ "C",
                           (score >=81 & score <=90) ~ "B",
                           (score >= 91) ~ "A"))


dat %>% 
  ggplot(aes(x = reorder(grade, desc(grade)), y = score, colour = grade)) +
  geom_jitter() +
  theme_classic() +
  scale_color_nord(palette = "red_mountain") +
  labs(x = "Grade", y = "% Score", title = "Grade and score distribution for 100 students") +
  theme(legend.position = "none")

dat %>% 
  group_by(grade) %>% 
  summarise(mean = mean(score),
            sd = sd(score),
            min = min(score),
            max = max(score),
            n = n())
