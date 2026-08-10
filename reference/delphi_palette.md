# Get a Delphi palette

Retrieve a palette by name. The first palette, `mayfair`, is used by
default. Set `type = "continuous"` and supply `n` to interpolate a
palette to an arbitrary number of colors.

## Usage

``` r
delphi_palette(name = "mayfair", n = NULL, type = "discrete", direction = 1)
```

## Arguments

- name:

  A single palette name, as returned by `names(delphi_palettes())`.
  Defaults to `"mayfair"`, the first palette.

- n:

  Number of colors to return. Defaults to the palette's full length;
  required when `type = "continuous"`.

- type:

  Whether to return the palette's discrete colors or an interpolated
  continuous palette.

- direction:

  Color order: `1` retains the original order and `-1` reverses it.
  Applied to the full palette before `n` selects a subset, so `n` colors
  with `direction = -1` are the *last* `n` colors of the original order,
  reversed.

## Value

A character vector of hexadecimal colors.

## Examples

``` r
delphi_palette("mayfair")
#> [1] "#1a2634" "#2d4a3e" "#6b1c2a" "#c9b896" "#f5f0e6"
delphi_palette("mayfair", n = 8, type = "continuous")
#> [1] "#1A2634" "#243A39" "#35433B" "#59292F" "#854848" "#BBA186" "#DBD0B8"
#> [8] "#F5F0E6"
delphi_palette(direction = -1)
#> [1] "#f5f0e6" "#c9b896" "#6b1c2a" "#2d4a3e" "#1a2634"
```
