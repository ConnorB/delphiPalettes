# Delphi palette scales for ggplot2

Discrete and continuous color/fill scales for ggplot2, built from a
Delphi palette. `scale_color_delphi_d()` and `scale_fill_delphi_d()` map
a discrete variable to a palette's colors, extending the palette by
interpolation if there are more levels than the palette has colors.
`scale_color_delphi_c()` and `scale_fill_delphi_c()` map a continuous
variable through the palette, interpolating between its colors.
`scale_colour_delphi_d()` and `scale_colour_delphi_c()` are aliases for
the `scale_color_delphi_*()` functions.

## Usage

``` r
scale_color_delphi_d(name = "mayfair", direction = 1, ...)

scale_fill_delphi_d(name = "mayfair", direction = 1, ...)

scale_color_delphi_c(name = "mayfair", direction = 1, ...)

scale_fill_delphi_c(name = "mayfair", direction = 1, ...)

scale_colour_delphi_d(name = "mayfair", direction = 1, ...)

scale_colour_delphi_c(name = "mayfair", direction = 1, ...)
```

## Arguments

- name:

  A single palette name, as returned by `names(delphi_palettes())`.
  Defaults to `"mayfair"`, the first palette.

- direction:

  Color order: `1` retains the original order and `-1` reverses it.

- ...:

  Passed on to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  (for the `_d()` scales) or
  [`ggplot2::scale_color_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)
  /
  [`ggplot2::scale_fill_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html)
  (for the `_c()` scales). This package's own `name` argument occupies
  the slot ggplot2 usually reserves for the scale title; set a legend
  title with
  [`ggplot2::labs()`](https://ggplot2.tidyverse.org/reference/labs.html)
  instead.

## Value

A ggplot2 `Scale` object.

## Examples

``` r
if (requireNamespace("ggplot2", quietly = TRUE)) {
  library(ggplot2)

  ggplot(iris, aes(Species, Sepal.Length, fill = Species)) +
    geom_boxplot() +
    scale_fill_delphi_d("pride")

  ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Petal.Length)) +
    geom_point(size = 2) +
    scale_color_delphi_c("mayfair")
}
```
