# Delphi palette scales for ggplot2

Uses Delphi palettes in
[ggplot2](https://ggplot2.tidyverse.org/reference/ggplot2-package.html)
scales. The discrete scales assign colors to factor levels. Extra factor
levels cause the scales to interpolate colors. The continuous scales
assign colors to numeric values. `scale_colour_delphi_d()` and
`scale_colour_delphi_c()` are aliases.

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

  A single palette name. Use
  [`delphi_palettes()`](https://connorb.github.io/delphiPalettes/reference/delphi_palettes.md)
  to get palette names. The default is `"mayfair"`.

- direction:

  The color order. Use `1` for the stored order. Use `-1` to reverse the
  stored order.

- ...:

  Arguments for
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html)
  or
  [`ggplot2::scale_color_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).
  Use
  [`ggplot2::labs()`](https://ggplot2.tidyverse.org/reference/labs.html)
  to set the legend title.

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
