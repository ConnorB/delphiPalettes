#' Delphi palette collection
#'
#' Returns the Delphi palette collection. Palette names use lowercase letters
#' and hyphens. For example, use `mayfair` or `perito-moreno`.
#'
#' @param category An optional category. It must be one of `classic`, `nature`,
#'   `keycaps`, `vintage`, `modern`, `bold`, `soft`, `monochrome`, `seasonal`,
#'   or `artistic`.
#' @param colorblind_friendly If `TRUE`, returns only palettes that pass
#'   [delphi_palette_colorblind()].
#' @return A named list. Each element is a character vector of hexadecimal
#'   colors.
#' @export
#' @examples
#' delphi_palettes("nature")
#' delphi_palettes(colorblind_friendly = TRUE)
delphi_palettes <- function(category = NULL, colorblind_friendly = FALSE) {
  if (
    !is.logical(colorblind_friendly) ||
      length(colorblind_friendly) != 1L ||
      is.na(colorblind_friendly)
  ) {
    cli::cli_abort(
      c(
        "{.arg colorblind_friendly} must be {.val TRUE} or {.val FALSE}.",
        "i" = "Read {.help [{.fun delphiPalettes::delphi_palettes}](delphiPalettes::delphi_palettes)} for details."
      )
    )
  }

  result <- palettes
  if (colorblind_friendly) {
    result <- result[colorblind_friendly_lookup[names(result)]]
  }

  if (is.null(category)) {
    return(result)
  }

  if (!is.character(category) || length(category) != 1L || is.na(category)) {
    cli::cli_abort(
      c(
        "{.arg category} must be one character string. It cannot be missing.",
        "i" = "Read {.help [{.fun delphiPalettes::delphi_palettes}](delphiPalettes::delphi_palettes)} for available categories."
      )
    )
  }

  available <- unique(unname(categories))
  if (!category %in% available) {
    cli::cli_abort(
      c(
        "Unknown palette category {.val {category}}.",
        "i" = "Available categories: {.val {available}}.",
        "i" = "Read {.help [{.fun delphiPalettes::delphi_palettes}](delphiPalettes::delphi_palettes)} for details."
      )
    )
  }

  result[categories[names(result)] == category]
}
