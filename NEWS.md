# delphiPalettes 0.0.0.9000

* `delphi_palette()` gains a `direction` argument to reverse color order and
  defaults to the first palette.
* `print_delphi_palette()` draws a selected palette and returns its colors
  invisibly.
* `delphi_palette()` now errors when `type = "continuous"` is requested
  without `n`, instead of silently returning the discrete palette unchanged.
* `delphi_palette()` now applies `direction` to the full palette before
  subsetting to `n`, so `n` colors with `direction = -1` are the last `n`
  colors of the original order, reversed (previously the first `n` colors
  were selected, then reversed).
* `delphi_palette(type = "continuous")` now preserves the alpha channel when
  interpolating palettes that use 8-digit hex colors (e.g. `"glassmorphism"`),
  instead of silently dropping it.
* New `delphi_palette_colorblind()` reports whether a palette is
  colorblind-friendly (every color pair distinguishable in the original
  palette stays distinguishable under simulated deuteranopia, protanopia,
  and tritanopia), as determined by the 'colorblindcheck' package.
* `delphi_palettes()` gains a `colorblind_friendly` argument to filter the
  collection down to only colorblind-friendly palettes, combinable with
  `category`.
* New `print_delphi_palettes()` draws a grid of palette swatches for
  browsing the collection, or a subset filtered by `category` and/or
  `colorblind_friendly`, at a glance.
* New ggplot2 scales: `scale_color_delphi_d()` / `scale_fill_delphi_d()`
  for discrete data (extending a palette by interpolation if there are more
  levels than colors) and `scale_color_delphi_c()` / `scale_fill_delphi_c()`
  for continuous data, with `scale_colour_*()` aliases. ggplot2 is a
  'Suggests' dependency, only required when these scales are used.
