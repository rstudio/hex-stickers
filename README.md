# hex-stickers <img src="SVG/RStudio.svg" width="120" align="right" />

All RStudio hex logos as either [PNG](PNG/#readme) or [SVG](SVG/#readme).

All stickers are licensed with [CC0](LICENSE.md).

## Buying stickers

Many stickers can be purchased from <http://swag.rstudio.com/>.

## Printing stickers

Details are [here](./stickermule.md).

## Adding new stickers

If you're an RStudio employee, you can add new stickers to this repo by creating a pull request. The pull request should contain two files:

* A `.svg` in the `SVG` directory (with fonts converted to outlines)
* A `.png` in the `PNG` directory (with dimensions 2206 x 2557). 

If you only have the `.svg`, you can use the following code to generate the `.png`:

```R
library(rsvg)
pkg <- "foofy"
rsvg_png(paste0("SVG/", pkg, ".svg"), paste0("PNG/", pkg, ".png"), height = 2557)
```
