# delphiPalettes 0.0.0.9000

* [delphi_palette()](https://connorb.github.io/delphiPalettes/reference/delphi_palette.html) defaults to `"mayfair"` and adds `direction` to reverse the color order.
* [delphi_palette()](https://connorb.github.io/delphiPalettes/reference/delphi_palette.html) requires `n` for `type = "continuous"`.
* [delphi_palette()](https://connorb.github.io/delphiPalettes/reference/delphi_palette.html) applies `direction` before it selects `n` colors.
* [delphi_palette()](https://connorb.github.io/delphiPalettes/reference/delphi_palette.html) keeps alpha values during continuous interpolation.
* [delphi_palette_colorblind()](https://connorb.github.io/delphiPalettes/reference/delphi_palette_colorblind.html) reports the stored color vision result from [colorblindcheck](https://cran.r-project.org/package=colorblindcheck).
* [delphi_palettes()](https://connorb.github.io/delphiPalettes/reference/delphi_palettes.html) adds `colorblind_friendly` to select palettes with a positive color vision result.
* [print_delphi_palette()](https://connorb.github.io/delphiPalettes/reference/print_delphi_palette.html) draws a selected palette and returns its colors invisibly.
* [print_delphi_palettes()](https://connorb.github.io/delphiPalettes/reference/print_delphi_palettes.html) draws palettes as a grid and can filter by category or color vision result.
* [print_delphi_palettes()](https://connorb.github.io/delphiPalettes/reference/print_delphi_palettes.html) draws the unfiltered collection on one graphics page per category.
* The [ggplot2](https://ggplot2.tidyverse.org/) scales map discrete or continuous data to Delphi palette colors. The package loads ggplot2 only when you use a scale.
