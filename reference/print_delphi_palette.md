# Print a Delphi palette

Draw a palette with its name above the color swatches. The colors are
also returned invisibly.

## Usage

``` r
print_delphi_palette(name = "mayfair", direction = 1)
```

## Arguments

- name:

  A single palette name, as returned by `names(delphi_palettes())`.
  Defaults to `"mayfair"`, the first palette.

- direction:

  Color order: `1` retains the original order and `-1` reverses it.
  Applied to the full palette before `n` selects a subset, so `n` colors
  with `direction = -1` are the *last* `n` colors of the original order,
  reversed.

## Value

The selected hexadecimal colors, invisibly.

## Examples

``` r
print_delphi_palette()

print_delphi_palette("pride", direction = -1)
```
