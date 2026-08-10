# Display a grid of Delphi palettes

Draws a grid of palette swatches, one panel per palette, for browsing
the collection – or a filtered subset of it – at a glance.

## Usage

``` r
print_delphi_palettes(
  category = NULL,
  colorblind_friendly = FALSE,
  direction = 1
)
```

## Arguments

- category:

  An optional palette category. One of `classic`, `nature`, `keycaps`,
  `vintage`, `modern`, `bold`, `soft`, `monochrome`, `seasonal`, or
  `artistic`.

- colorblind_friendly:

  If `TRUE`, only return palettes that are colorblind-friendly. See
  [`delphi_palette_colorblind()`](https://connorb.github.io/delphiPalettes/reference/delphi_palette_colorblind.md)
  for what that means.

- direction:

  Color order: `1` retains the original order and `-1` reverses it.
  Applied to every palette shown.

## Value

The names of the displayed palettes, invisibly.

## Examples

``` r
print_delphi_palettes("keycaps")

print_delphi_palettes(colorblind_friendly = TRUE)
```
