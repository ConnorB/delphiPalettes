#' Get a Delphi palette
#'
#' Returns colors from one Delphi palette. The default palette is `mayfair`.
#' Set `type = "continuous"` and `n` to interpolate colors.
#'
#' @param name A single palette name. Use [delphi_palettes()] to get palette
#'   names. The default is `"mayfair"`.
#' @param n The number of colors to return. The default returns all colors.
#'   You must set `n` for `type = "continuous"`.
#' @param type The palette type. Use `"discrete"` for stored colors. Use
#'   `"continuous"` for interpolated colors.
#' @param direction The color order. Use `1` for the stored order. Use `-1` to
#'   reverse the stored order before this function selects `n` colors.
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
        "{.arg type} must be {.val discrete} or {.val continuous}.",
        "i" = "Read {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
      )
    )
  }

  if (type == "continuous" && is.null(n)) {
    cli::cli_abort(
      c(
        "{.arg n} is required for {.code type = \"continuous\"}.",
        "i" = "Read {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
      )
    )
  }

  direction <- .delphi_palette_direction(direction)
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
          "i" = "Read {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
        )
      )
    }
    n <- as.integer(n)

    if (type == "discrete") {
      if (n > length(colors)) {
        cli::cli_abort(
          c(
            "Palette {.val {name}} contains only {length(colors)} color{?s}.",
            "i" = "Read {.help [{.fun delphiPalettes::delphi_palette}](delphiPalettes::delphi_palette)} to interpolate colors."
          )
        )
      }
      colors <- colors[seq_len(n)]
    } else {
      colors <- .delphi_continuous_palette(colors, n)
    }
  }

  colors
}
