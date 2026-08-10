# Check whether a palette is colorblind-friendly

Checks whether a palette is colorblind-friendly. A palette is
colorblind-friendly when every color pair distinguishable in the
original palette remains distinguishable under simulated deuteranopia,
protanopia, and tritanopia, as determined by the colorblindcheck
package. Verdicts are precomputed and shipped with the package; see
`data-raw/colorblind-friendly.R` in the source repository to see how
they were generated or to regenerate them after a palette's colors
change.

## Usage

``` r
delphi_palette_colorblind(name)
```

## Arguments

- name:

  A single palette name, as returned by `names(delphi_palettes())`.

## Value

`TRUE` or `FALSE`.

## Examples

``` r
delphi_palette_colorblind("dove")
#> [1] TRUE
delphi_palette_colorblind("pinata")
#> [1] FALSE
```
