# hex-stickers <img src="SVG/RStudio.svg" width="120" align="right" />

All RStudio hex logos as either [PNG](PNG/#readme) or [SVG](SVG/#readme).

All stickers are licensed with [CC0](LICENSE.md).

## Buying stickers

Many stickers can be purchased from <http://swag.rstudio.com/>.

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

## Printing stickers

Details are [here](./stickermule.md).
