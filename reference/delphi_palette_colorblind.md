# Report palette color vision support

Reports whether a palette keeps every distinct color pair under
simulated deuteranopia, protanopia, and tritanopia. The package stores
this result for each palette.
[`colorblindcheck::palette_check()`](https://jakubnowosad.com/colorblindcheck/reference/palette_check.html)
creates the results in `data-raw/palettes.R`.

## Usage

``` r
delphi_palette_colorblind(name)
```

## Arguments

- name:

  A single palette name. Use
  [`delphi_palettes()`](https://connorb.github.io/delphiPalettes/reference/delphi_palettes.md)
  to get palette names.

## Value

`TRUE` or `FALSE`.

## Examples

``` r
delphi_palette_colorblind("dove")
#> [1] TRUE
delphi_palette_colorblind("pinata")
#> [1] FALSE
```
