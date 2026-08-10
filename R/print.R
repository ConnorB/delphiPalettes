#' Print a Delphi palette
#'
#' Draws one palette with its name above the color swatches. Returns the colors
#' invisibly.
#'
#' @inheritParams delphi_palette
#' @return The selected hexadecimal colors. The function returns them
#'   invisibly.
#' @export
#' @importFrom grDevices rgb
#' @importFrom graphics image par rect text
#' @examples
#' print_delphi_palette()
#' print_delphi_palette("pride", direction = -1)
print_delphi_palette <- function(name = "mayfair", direction = 1) {
  palette_name <- .delphi_palette_name(name)
  direction <- .delphi_palette_direction(direction)
  colors <- palettes[[palette_name]]
  if (direction == -1) {
    colors <- rev(colors)
  }
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
#' Draws one panel for each palette. You can limit the result by category or
#' color vision support. With the default filters, each category uses one
#' graphics page.
#'
#' @inheritParams delphi_palettes
#' @param direction The color order. Use `1` for the stored order. Use `-1` to
#'   reverse every palette.
#' @return The names of the shown palettes. The function returns them
#'   invisibly.
#' @export
#' @importFrom grDevices n2mfrow
#' @importFrom graphics layout par plot plot.new polygon
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
      "No palette matches {.arg category} and {.arg colorblind_friendly}."
    )
  }

  direction <- .delphi_palette_direction(direction)

  old <- par(no.readonly = TRUE)
  on.exit(par(old), add = TRUE)

  pages <- .delphi_palette_pages(
    palettes,
    category,
    paginate = !colorblind_friendly
  )
  for (page in pages) {
    .delphi_print_palette_page(page, direction)
  }

  invisible(names(palettes))
}

.delphi_palette_pages <- function(palette_data, category, paginate) {
  if (!is.null(category) || !paginate) {
    return(stats::setNames(list(palette_data), category))
  }

  palette_categories <- categories[names(palette_data)]
  page_categories <- unique(unname(categories))
  page_categories <- page_categories[page_categories %in% palette_categories]

  stats::setNames(
    lapply(page_categories, function(page_category) {
      palette_data[palette_categories == page_category]
    }),
    page_categories
  )
}

.delphi_print_palette_page <- function(palette_data, direction) {
  grid <- n2mfrow(length(palette_data))
  layout(matrix(
    seq_len(prod(grid)),
    nrow = grid[1],
    ncol = grid[2],
    byrow = TRUE
  ))

  for (name in names(palette_data)) {
    colors <- palette_data[[name]]
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

  for (unused_panel in seq_len(prod(grid) - length(palette_data))) {
    plot.new()
  }
}
