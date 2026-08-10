#' Delphi palette scales for ggplot2
#'
#' Discrete and continuous color/fill scales for \pkg{ggplot2}, built from a
#' Delphi palette. `scale_color_delphi_d()` and `scale_fill_delphi_d()` map a
#' discrete variable to a palette's colors, extending the palette by
#' interpolation if there are more levels than the palette has colors.
#' `scale_color_delphi_c()` and `scale_fill_delphi_c()` map a continuous
#' variable through the palette, interpolating between its colors.
#' `scale_colour_delphi_d()` and `scale_colour_delphi_c()` are aliases for the
#' `scale_color_delphi_*()` functions.
#'
#' @param name A single palette name, as returned by
#'   `names(delphi_palettes())`. Defaults to `"mayfair"`, the first palette.
#' @param direction Color order: `1` retains the original order and `-1`
#'   reverses it.
#' @param ... Passed on to `ggplot2::discrete_scale()` (for the `_d()`
#'   scales) or `ggplot2::scale_color_gradientn()` / `ggplot2::scale_fill_gradientn()`
#'   (for the `_c()` scales). This package's own `name` argument occupies the
#'   slot ggplot2 usually reserves for the scale title; set a legend title
#'   with `ggplot2::labs()` instead.
#' @return A ggplot2 `Scale` object.
#' @examples
#' if (requireNamespace("ggplot2", quietly = TRUE)) {
#'   library(ggplot2)
#'
#'   ggplot(iris, aes(Species, Sepal.Length, fill = Species)) +
#'     geom_boxplot() +
#'     scale_fill_delphi_d("pride")
#'
#'   ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Petal.Length)) +
#'     geom_point(size = 2) +
#'     scale_color_delphi_c("mayfair")
#' }
#' @name scale_delphi
NULL

#' @rdname scale_delphi
#' @export
scale_color_delphi_d <- function(name = "mayfair", direction = 1, ...) {
  rlang::check_installed("ggplot2")
  name <- .delphi_palette_name(name)
  direction <- .delphi_palette_direction(direction)

  ggplot2::discrete_scale(
    aesthetics = "color",
    palette = .delphi_discrete_palette(name, direction),
    ...
  )
}

#' @rdname scale_delphi
#' @export
scale_fill_delphi_d <- function(name = "mayfair", direction = 1, ...) {
  rlang::check_installed("ggplot2")
  name <- .delphi_palette_name(name)
  direction <- .delphi_palette_direction(direction)

  ggplot2::discrete_scale(
    aesthetics = "fill",
    palette = .delphi_discrete_palette(name, direction),
    ...
  )
}

#' @rdname scale_delphi
#' @export
scale_color_delphi_c <- function(name = "mayfair", direction = 1, ...) {
  rlang::check_installed("ggplot2")
  name <- .delphi_palette_name(name)
  colors <- delphi_palette(name = name, direction = direction)

  ggplot2::scale_color_gradientn(colors = colors, ...)
}

#' @rdname scale_delphi
#' @export
scale_fill_delphi_c <- function(name = "mayfair", direction = 1, ...) {
  rlang::check_installed("ggplot2")
  name <- .delphi_palette_name(name)
  colors <- delphi_palette(name = name, direction = direction)

  ggplot2::scale_fill_gradientn(colors = colors, ...)
}

#' @rdname scale_delphi
#' @export
scale_colour_delphi_d <- scale_color_delphi_d

#' @rdname scale_delphi
#' @export
scale_colour_delphi_c <- scale_color_delphi_c

.delphi_discrete_palette <- function(name, direction) {
  full <- delphi_palettes()[[name]]

  function(n) {
    if (n <= length(full)) {
      delphi_palette(name = name, n = n, direction = direction)
    } else {
      delphi_palette(name = name, n = n, type = "continuous", direction = direction)
    }
  }
}
