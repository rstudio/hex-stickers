# Experiment converting svg to png using rsvg package
# It doesn't yield great results on files like purrr, which
# is really a raster image.

library(fs)
library(rsvg)
library(purrr)

png <- dir_ls("png", glob = "*.png")
dims <- purrr::map(png, ~ dim(png::readPNG(.x)))
cbind(
  dims %>% map_int(1),
  dims %>% map_int(2)
)

svg <- dir_ls("svg", glob = "*.svg")

png_name <- path_ext_remove(path_file(png))
svg_name <- path_ext_remove(path_file(svg))
setdiff(png_name, svg_name)
setdiff(svg_name, png_name)

dir_create("png-lowres")
out <- path("png-lowres", path_ext_set(path_file(svg), "png"))
walk2(svg, out, rsvg_png, width = 240)

dir_create("png-hires")
out <- path("png-hires", path_ext_set(path_file(svg), "png"))
walk2(svg, out, rsvg_png, width = 2400)


