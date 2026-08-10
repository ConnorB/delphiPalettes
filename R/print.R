#' Print a Delphi palette
#'
#' Draw a palette with its name above the color swatches. The colors are also
#' returned invisibly.
#'
#' @inheritParams delphi_palette
#' @return The selected hexadecimal colors, invisibly.
#' @export
#' @importFrom grDevices rgb
#' @importFrom graphics image par rect text
#' @examples
#' print_delphi_palette()
#' print_delphi_palette("pride", direction = -1)
print_delphi_palette <- function(name = "mayfair", direction = 1) {
  palette_name <- .delphi_palette_name(name)
  colors <- delphi_palette(name = palette_name, direction = direction)
  n <- length(colors)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old), add = TRUE)

  image(
    seq_len(n),
    1,
    as.matrix(seq_len(n)),
    col = colors,
    axes = FALSE,
    xlab = "",
    ylab = "",
    bty = "n"
  )

  rect(0, 0.92, n + 1, 1.08, col = rgb(1, 1, 1, 0.8), border = NA)
  text(
    (n + 1) / 2,
    1,
    labels = palette_name,
    cex = 2.5,
    family = "serif"
  )

  invisible(colors)
}

#' Display a grid of Delphi palettes
#'
#' Draws a grid of palette swatches, one panel per palette, for browsing the
#' collection -- or a filtered subset of it -- at a glance.
#'
#' @inheritParams delphi_palettes
#' @param direction Color order: `1` retains the original order and `-1`
#'   reverses it. Applied to every palette shown.
#' @return The names of the displayed palettes, invisibly.
#' @export
#' @importFrom grDevices n2mfrow
#' @importFrom graphics layout par plot polygon
#' @examples
#' print_delphi_palettes("keycaps")
#' print_delphi_palettes(colorblind_friendly = TRUE)
print_delphi_palettes <- function(
  category = NULL,
  colorblind_friendly = FALSE,
  direction = 1
) {
  palettes <- delphi_palettes(
    category = category,
    colorblind_friendly = colorblind_friendly
  )

  if (length(palettes) == 0L) {
    cli::cli_abort(
      "No palettes match {.arg category} and {.arg colorblind_friendly}."
    )
  }

  direction <- .delphi_palette_direction(direction)

  old <- par(no.readonly = TRUE)
  on.exit(par(old), add = TRUE)

  grid <- n2mfrow(length(palettes))
  layout(matrix(seq_len(prod(grid)), nrow = grid[1], ncol = grid[2], byrow = TRUE))

  for (name in names(palettes)) {
    colors <- palettes[[name]]
    if (direction == -1) {
      colors <- rev(colors)
    }
    n <- length(colors)

    par(mar = c(0.1, 0.1, 1.2, 0.1))
    plot(
      NA,
      xlim = c(0, n),
      ylim = c(0, 1),
      xaxt = "n",
      yaxt = "n",
      xlab = "",
      ylab = "",
      bty = "n",
      main = name,
      cex.main = 0.8
    )
    for (j in seq_len(n)) {
      polygon(
        x = c(j - 1, j - 1, j, j),
        y = c(0, 1, 1, 0),
        border = NA,
        col = colors[j]
      )
    }
  }

  invisible(names(palettes))
}
