# hex-stickers <img src="svg/R Studio.svg" width="120" align="right" />

All RStudio hex logos as either [PNG](PNG/) or [SVG](SVG/).

All stickers are under with [CC0](license.md).

## Adding new stickers

When registering on [hexb.in](http://hexb.in), remember to add a `.json` file in `meta/` using this template:

```json
{
  "name": "dplyr",
  "author": "rstudio",
  "license": "CC0",
  "raster": "https://github.com/rstudio/hex-stickers/blob/master/PNG/dplyr.png",
  "vector": "https://github.com/rstudio/hex-stickers/blob/master/SVG/dplyr.svg",
  "description": "dplyr: A Grammar of Data Manipulation.",
  "filename": "meta/dplyr.json"
}
```

Make sure name only has lowercase letters, numbers and hyphens
