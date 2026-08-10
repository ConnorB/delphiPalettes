#' Get a Delphi palette
#'
#' Retrieve a palette by name. The first palette, `mayfair`, is used by
#' default. Set `type = "continuous"` and supply `n` to interpolate a palette
#' to an arbitrary number of colors.
#'
#' @param name A single palette name, as returned by
#'   `names(delphi_palettes())`. Defaults to `"mayfair"`, the first palette.
#' @param n Number of colors to return. Defaults to the palette's full
#'   length; required when `type = "continuous"`.
#' @param type Whether to return the palette's discrete colors or an
#'   interpolated continuous palette.
#' @param direction Color order: `1` retains the original order and `-1`
#'   reverses it. Applied to the full palette before `n` selects a subset, so
#'   `n` colors with `direction = -1` are the *last* `n` colors of the
#'   original order, reversed.
#' @return A character vector of hexadecimal colors.
#' @export
#' @examples
#' delphi_palette("mayfair")
#' delphi_palette("mayfair", n = 8, type = "continuous")
#' delphi_palette(direction = -1)
delphi_palette <- function(
  name = "mayfair",
  n = NULL,
  type = "discrete",
  direction = 1
) {
  name <- .delphi_palette_name(name)

  if (
    !is.character(type) ||
      length(type) != 1L ||
      is.na(type) ||
      !type %in% c("discrete", "continuous")
  ) {
    cli::cli_abort(
      c(
        "{.arg type} must be either {.val discrete} or {.val continuous}.",
        "i" = "See {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
      )
    )
  }

  if (type == "continuous" && is.null(n)) {
    cli::cli_abort(
      c(
        "{.arg n} is required when {.code type = \"continuous\"}.",
        "i" = "See {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
      )
    )
  }

  direction <- .delphi_palette_direction(direction)
  palettes <- delphi_palettes()

  colors <- palettes[[name]]
  if (direction == -1) {
    colors <- rev(colors)
  }

  if (!is.null(n)) {
    if (
      !is.numeric(n) ||
        length(n) != 1L ||
        !is.finite(n) ||
        n < 1 ||
        n != as.integer(n)
    ) {
      cli::cli_abort(
        c(
          "{.arg n} must be a positive whole number.",
          "i" = "See {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
        )
      )
    }
    n <- as.integer(n)

    if (type == "discrete") {
      if (n > length(colors)) {
        cli::cli_abort(
          c(
            "Palette {.val {name}} has only {length(colors)} color{?s}.",
            "i" = "See {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} for continuous interpolation."
          )
        )
      }
      colors <- colors[seq_len(n)]
    } else {
      has_alpha <- any(nchar(colors) == 9L)
      colors <- grDevices::colorRampPalette(colors, alpha = has_alpha)(n)
    }
  }

  colors
}
