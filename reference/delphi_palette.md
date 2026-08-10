# Get a Delphi palette

Returns colors from one Delphi palette. The default palette is
`mayfair`. Set `type = "continuous"` and `n` to interpolate colors.

## Usage

``` r
delphi_palette(name = "mayfair", n = NULL, type = "discrete", direction = 1)
```

## Arguments

- name:

  A single palette name. Use
  [`delphi_palettes()`](https://connorb.github.io/delphiPalettes/reference/delphi_palettes.md)
  to get palette names. The default is `"mayfair"`.

- n:

  The number of colors to return. The default returns all colors. You
  must set `n` for `type = "continuous"`.

- type:

  The palette type. Use `"discrete"` for stored colors. Use
  `"continuous"` for interpolated colors.

- direction:

  The color order. Use `1` for the stored order. Use `-1` to reverse the
  stored order before this function selects `n` colors.

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
