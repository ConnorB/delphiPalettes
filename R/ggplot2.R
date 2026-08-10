#' Delphi palette scales for ggplot2
#'
#' Uses Delphi palettes in [ggplot2] scales. The discrete scales assign colors
#' to factor levels. Extra factor levels cause the scales to interpolate colors.
#' The continuous scales assign colors to numeric values.
#' [scale_colour_delphi_d()] and [scale_colour_delphi_c()] are aliases.
#'
#' @param name A single palette name. Use [delphi_palettes()] to get palette
#'   names. The default is `"mayfair"`.
#' @param direction The color order. Use `1` for the stored order. Use `-1` to
#'   reverse the stored order.
#' @param ... Arguments for [ggplot2::discrete_scale()] or
#'   [ggplot2::scale_color_gradientn()]. Use [ggplot2::labs()] to set the
#'   legend title.
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
    palette = .delphi_discrete_palette(palettes[[name]], direction),
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
    palette = .delphi_discrete_palette(palettes[[name]], direction),
    ...
  )
}

#' @rdname scale_delphi
#' @export
scale_color_delphi_c <- function(name = "mayfair", direction = 1, ...) {
  rlang::check_installed("ggplot2")
  name <- .delphi_palette_name(name)
  direction <- .delphi_palette_direction(direction)
  colors <- palettes[[name]]
  if (direction == -1) {
    colors <- rev(colors)
  }

  ggplot2::scale_color_gradientn(colors = colors, ...)
}

#' @rdname scale_delphi
#' @export
scale_fill_delphi_c <- function(name = "mayfair", direction = 1, ...) {
  rlang::check_installed("ggplot2")
  name <- .delphi_palette_name(name)
  direction <- .delphi_palette_direction(direction)
  colors <- palettes[[name]]
  if (direction == -1) {
    colors <- rev(colors)
  }

  ggplot2::scale_fill_gradientn(colors = colors, ...)
}

#' @rdname scale_delphi
#' @export
scale_colour_delphi_d <- scale_color_delphi_d

#' @rdname scale_delphi
#' @export
scale_colour_delphi_c <- scale_color_delphi_c

.delphi_discrete_palette <- function(colors, direction) {
  if (direction == -1) {
    colors <- rev(colors)
  }

  function(n) {
    if (n <= length(colors)) {
      colors[seq_len(n)]
    } else {
      .delphi_continuous_palette(colors, n)
    }
  }
}
