# Print a Delphi palette

Draws one palette with its name above the color swatches. Returns the
colors invisibly.

## Usage

``` r
print_delphi_palette(name = "mayfair", direction = 1)
```

## Arguments

- name:

  A single palette name. Use
  [`delphi_palettes()`](https://connorb.github.io/delphiPalettes/reference/delphi_palettes.md)
  to get palette names. The default is `"mayfair"`.

- direction:

  The color order. Use `1` for the stored order. Use `-1` to reverse the
  stored order before this function selects `n` colors.

## Value

The selected hexadecimal colors. The function returns them invisibly.

## Examples

``` r
print_delphi_palette()

print_delphi_palette("pride", direction = -1)
```
