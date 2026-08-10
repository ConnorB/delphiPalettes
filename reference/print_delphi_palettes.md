# Display a grid of Delphi palettes

Draws one panel for each palette. You can limit the result by category
or color vision support. With the default filters, each category uses
one graphics page.

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

  An optional category. It must be one of `classic`, `nature`,
  `keycaps`, `vintage`, `modern`, `bold`, `soft`, `monochrome`,
  `seasonal`, or `artistic`.

- colorblind_friendly:

  If `TRUE`, returns only palettes that pass
  [`delphi_palette_colorblind()`](https://connorb.github.io/delphiPalettes/reference/delphi_palette_colorblind.md).

- direction:

  The color order. Use `1` for the stored order. Use `-1` to reverse
  every palette.

## Value

The names of the shown palettes. The function returns them invisibly.

## Examples

``` r
print_delphi_palettes("keycaps")

print_delphi_palettes(colorblind_friendly = TRUE)
```
