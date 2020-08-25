# Code for analysing number of stickers from google form surveys

library(tidyverse)
library(googlesheets4)
library(fs)

all <- dir_ls("png") %>%
  path_file() %>%
  path_ext_remove()

sheet <- read_sheet("1fAFly-1COje6aqahngi2CclzVQcgZYapa53hLjGROMc")
names(sheet)[2] <- "stickers"
nrow(sheet)

counts <- sheet %>%
  separate_rows(stickers, sep = ", ") %>%
  count(stickers, sort = TRUE) %>%
  filter(!is.na(stickers)) %>%
  filter(n > 10) %>%
  mutate(order = n / sum(n) * 38000)

counts %>%
  complete(stickers = all) %>%
  arrange(desc(n)) %>%
  transmute(sticker = stickers, n = round(order, -2))

counts %>%
  ggplot(aes(n, fct_reorder(stickers, n))) +
  geom_point() +
  ylab("Sticker")
