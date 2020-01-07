#' ---
#' output: github_document
#' ---

# Code for comparing overlap (or lack thereof) in PNG/ SVG/ meta/

library(tidyverse)
library(fs)

list_packages <- function(folder) {
  pkgs <- dir_ls(folder, regexp = "[.][Rr]?md$", invert = TRUE) %>%
    path_file() %>%
    path_ext_remove()
  tibble(pkg = pkgs, !!folder := TRUE)
}

df <- list_packages("PNG") %>%
  full_join(list_packages("SVG")) %>%
  full_join(list_packages("meta"))

df %>%
  mutate(complete = pmap_lgl(select(., -pkg), complete.cases)) %>%
  filter(!complete) %>%
  select(-complete) %>%
  arrange(PNG, SVG, meta) %>%
  print(n = Inf)
