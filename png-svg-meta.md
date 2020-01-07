png-svg-meta.R
================
jenny
2020-01-07

``` r
# Code for comparing overlap (or lack thereof) in PNG/ SVG/ meta/

library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────────── tidyverse 1.2.1.9000 ──

    ## ✓ ggplot2 3.2.1          ✓ purrr   0.3.3.9000
    ## ✓ tibble  2.1.3          ✓ dplyr   0.8.3     
    ## ✓ tidyr   1.0.0.9000     ✓ stringr 1.4.0     
    ## ✓ readr   1.3.1          ✓ forcats 0.4.0

    ## ── Conflicts ─────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
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
```

    ## Joining, by = "pkg"

    ## Joining, by = "pkg"

``` r
df %>%
  mutate(complete = pmap_lgl(select(., -pkg), complete.cases)) %>%
  filter(!complete) %>%
  select(-complete) %>%
  arrange(PNG, SVG, meta) %>%
  print(n = Inf)
```

    ## # A tibble: 49 x 4
    ##    pkg            PNG   SVG   meta 
    ##    <chr>          <lgl> <lgl> <lgl>
    ##  1 R6             TRUE  TRUE  NA   
    ##  2 RStudio        TRUE  TRUE  NA   
    ##  3 applicable     TRUE  TRUE  NA   
    ##  4 blogdown       TRUE  TRUE  NA   
    ##  5 bookdown       TRUE  TRUE  NA   
    ##  6 connections    TRUE  TRUE  NA   
    ##  7 covr           TRUE  TRUE  NA   
    ##  8 dbplot         TRUE  TRUE  NA   
    ##  9 feather        TRUE  TRUE  NA   
    ## 10 flexdashboard  TRUE  TRUE  NA   
    ## 11 fs             TRUE  TRUE  NA   
    ## 12 glue           TRUE  TRUE  NA   
    ## 13 googledrive    TRUE  TRUE  NA   
    ## 14 googlesheets   TRUE  TRUE  NA   
    ## 15 lobstr         TRUE  TRUE  NA   
    ## 16 modeldb        TRUE  TRUE  NA   
    ## 17 modelr         TRUE  TRUE  NA   
    ## 18 parsnip        TRUE  TRUE  NA   
    ## 19 pins           TRUE  TRUE  NA   
    ## 20 pipe           TRUE  TRUE  NA   
    ## 21 pkgdown        TRUE  TRUE  NA   
    ## 22 plumber-female TRUE  TRUE  NA   
    ## 23 r2d3           TRUE  TRUE  NA   
    ## 24 readxl         TRUE  TRUE  NA   
    ## 25 recipes        TRUE  TRUE  NA   
    ## 26 reprex         TRUE  TRUE  NA   
    ## 27 reticulate     TRUE  TRUE  NA   
    ## 28 rlang          TRUE  TRUE  NA   
    ## 29 rsample        TRUE  TRUE  NA   
    ## 30 scales         TRUE  TRUE  NA   
    ## 31 sloop          TRUE  TRUE  NA   
    ## 32 tensorflow     TRUE  TRUE  NA   
    ## 33 tidymodels     TRUE  TRUE  NA   
    ## 34 tidyposterior  TRUE  TRUE  NA   
    ## 35 tidypredict    TRUE  TRUE  NA   
    ## 36 tidyverse      TRUE  TRUE  NA   
    ## 37 tune           TRUE  TRUE  NA   
    ## 38 usethis        TRUE  TRUE  NA   
    ## 39 vctrs          TRUE  TRUE  NA   
    ## 40 withr          TRUE  TRUE  NA   
    ## 41 xaringan       TRUE  TRUE  NA   
    ## 42 yardstick      TRUE  TRUE  NA   
    ## 43 ragg           TRUE  NA    TRUE 
    ## 44 dsbox          TRUE  NA    NA   
    ## 45 tidypredicts   NA    TRUE  NA   
    ## 46 magrittr       NA    NA    TRUE 
    ## 47 packrat        NA    NA    TRUE 
    ## 48 plumber        NA    NA    TRUE 
    ## 49 rstudio        NA    NA    TRUE
