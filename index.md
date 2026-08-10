# delphiPalettes

A collection of 284 color palettes for data visualisation, ported from
the [palette collection](https://delphi.tools/tools/palette-collection)
at [delphi.tools](https://delphi.tools) — a suite of privacy-respecting,
browser-based design tools created by
[delphi](https://github.com/1612elphi/delphitools). All palette designs
are delphi’s; this package just makes them usable from R.

## Installation

You can install the development version of delphiPalettes from
[GitHub](https://github.com/) with:

``` r

# install.packages("pak")
pak::pak("ConnorB/delphiPalettes")
```

``` r

library(delphiPalettes)
```

## A quick look

[`print_delphi_palettes()`](https://connorb.github.io/delphiPalettes/reference/print_delphi_palettes.md)
draws a grid of palette swatches, one panel per palette. Pass a
`category` or `colorblind_friendly = TRUE` to see a manageable slice of
the collection:

``` r

print_delphi_palettes("keycaps")
```

![Grid of 34 color palette swatches, one panel per palette in the
keycaps category, arranged 6 panels by 6 panels. Each panel is labeled
with its palette name, such as "2600", "dualshot", "nautilus", and
"vaporwave", above a horizontal strip of solid color
blocks.](reference/figures/README-quick-look-1.svg)

That’s the `keycaps` category (34 palettes); there are 284 in total
across ten categories. Leave `category` unset to grid the whole
collection at once (a large plot).

## Usage

Every palette has a lowercase, hyphenated name, like `"mayfair"` or
`"grand-budapest"`.
[`delphi_palette()`](https://connorb.github.io/delphiPalettes/reference/delphi_palette.md)
returns one as a character vector of hex colors:

``` r

delphi_palette("mayfair")
#> [1] "#1a2634" "#2d4a3e" "#6b1c2a" "#c9b896" "#f5f0e6"
```

[`print_delphi_palette()`](https://connorb.github.io/delphiPalettes/reference/print_delphi_palette.md)
draws it:

``` r

print_delphi_palette("mayfair")
```

![Horizontal strip of 5 solid color blocks labeled "mayfair" above the
strip. The colors move from dark navy blue and forest green through a
deep maroon red to a warm tan and pale
cream.](reference/figures/README-print-example-1.svg)

Reverse the color order with `direction = -1`, or take a subset with
`n`:

``` r

delphi_palette("grand-budapest", direction = -1)
#> [1] "#f0c040" "#7b2d5b" "#f5e6d3" "#9c4070" "#d4658f"
delphi_palette("pride", n = 3)
#> [1] "#e40303" "#ff8c00" "#ffed00"
```

Interpolate a palette to any number of colors with
`type = "continuous"`:

``` r

continuous <- delphi_palette("mayfair", n = 20, type = "continuous")
continuous
#>  [1] "#1A2634" "#1E2D36" "#223538" "#263C3A" "#2A443C" "#30473C" "#3D3D38"
#>  [8] "#4A3434" "#572A30" "#64202C" "#742C35" "#884D4C" "#9C6E62" "#B08E79"
#> [15] "#C4AF90" "#CFC0A2" "#D9CCB3" "#E2D8C4" "#EBE4D5" "#F5F0E6"
```

![Horizontal gradient bar showing the mayfair palette interpolated to 20
continuous color steps. The gradient blends smoothly from dark navy blue
through forest green and deep maroon red to tan and pale cream, with no
visible banding between adjacent
steps.](reference/figures/README-continuous-example-1.svg)

### Use with ggplot2

Discrete scales
([`scale_color_delphi_d()`](https://connorb.github.io/delphiPalettes/reference/scale_delphi.md)
/
[`scale_fill_delphi_d()`](https://connorb.github.io/delphiPalettes/reference/scale_delphi.md))
extend a palette by interpolation if there are more levels than colors;
continuous scales
([`scale_color_delphi_c()`](https://connorb.github.io/delphiPalettes/reference/scale_delphi.md)
/
[`scale_fill_delphi_c()`](https://connorb.github.io/delphiPalettes/reference/scale_delphi.md))
interpolate smoothly. `scale_colour_*()` spellings are provided as
aliases.

``` r

library(ggplot2)

ggplot(iris, aes(Species, Sepal.Length, fill = Species)) +
  geom_boxplot() +
  scale_fill_delphi_d("pride") +
  theme_minimal() +
  theme(legend.position = "none")
```

![Box plot chart. Iris species (setosa, versicolor, virginica) along the
x-axis, sepal length along the y-axis. Each box is filled with a
different color from the pride palette — red, orange, and yellow. Median
sepal length rises from setosa through versicolor to virginica, and the
spread of values widens across the same
order.](reference/figures/README-ggplot-discrete-1.svg)

``` r

ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Petal.Length)) +
  geom_point(size = 2) +
  scale_color_delphi_c("mayfair") +
  theme_minimal()
```

![Scatter chart. Sepal length along the x-axis, sepal width along the
y-axis, points colored on a continuous mayfair scale by petal length
(ranging from 1 to 6.9). Points cluster loosely with no strong linear
trend between sepal length and width, but color shifts from the dark end
of the scale at low sepal length values to the pale end at high sepal
length values, reflecting the strong correlation between petal length
and sepal length.](reference/figures/README-ggplot-continuous-1.svg)

### Categories

Palettes are grouped into ten categories — `classic`, `nature`,
`keycaps`, `vintage`, `modern`, `bold`, `soft`, `monochrome`,
`seasonal`, and `artistic`. Pass one to
[`delphi_palettes()`](https://connorb.github.io/delphiPalettes/reference/delphi_palettes.md)
to see just that group:

``` r

names(delphi_palettes("keycaps"))
#>  [1] "2600"            "8008"            "9009"            "dualshot"       
#>  [5] "handarbeit-r2"   "metropolis"      "milkshake"       "cafe"           
#>  [9] "oblivion"        "godspeed"        "carbon"          "miami"          
#> [13] "laser"           "nautilus"        "botanical"       "serika"         
#> [17] "mizu"            "bento"           "olivia"          "dracula"        
#> [21] "nord-keys"       "bushido"         "striker"         "modern-dolch"   
#> [25] "camping"         "noel"            "vaporwave"       "hyperfuse"      
#> [29] "peaches-n-cream" "terra"           "pulse"           "evil-dolch"     
#> [33] "taro"            "honeywell"
```

### Colorblind-friendly palettes

Every palette has been checked with
[colorblindcheck](https://cran.r-project.org/package=colorblindcheck)
for whether it stays distinguishable under simulated deuteranopia,
protanopia, and tritanopia.
[`delphi_palette_colorblind()`](https://connorb.github.io/delphiPalettes/reference/delphi_palette_colorblind.md)
reports the verdict for one palette, and
`delphi_palettes(colorblind_friendly = TRUE)` filters to only the 21
palettes that pass all three:

``` r

delphi_palette_colorblind("dove")
#> [1] TRUE
delphi_palette_colorblind("pinata")
#> [1] FALSE
```

``` r

print_delphi_palettes(colorblind_friendly = TRUE)
```

![Grid of 21 color palette swatches, one panel per palette that passes
deuteranopia, protanopia, and tritanopia checks, arranged 5 panels by 5
panels with 4 empty panels at the end. Each panel is labeled with its
palette name, such as "hokitika", "obsidian", "porcelain", and "escher",
above a horizontal strip of solid color
blocks.](reference/figures/README-colorblind-grid-1.svg)

## Credit

The palette designs in this package are not original work — they’re
ported from the palette collection built into
[delphi.tools](https://delphi.tools)
([source](https://github.com/1612elphi/delphitools)), created by delphi
(Ruby Morgan Voigt). delphiPalettes just packages that collection for
use in R (retrieval, interpolation, and colorblind-safety checks); all
credit for the palettes themselves belongs to the original designer.
delphitools is MIT licensed; its licence notice is reproduced alongside
this package’s own in
[LICENSE.md](https://connorb.github.io/delphiPalettes/LICENSE.md).
