#' Delphi palette collection
#'
#' Return the curated Delphi palette collection. Palette names use lowercase
#' hyphenated form, such as `mayfair` and `perito-moreno`.
#'
#' @param category An optional palette category. One of `classic`, `nature`,
#'   `keycaps`, `vintage`, `modern`, `bold`, `soft`, `monochrome`, `seasonal`,
#'   or `artistic`.
#' @param colorblind_friendly If `TRUE`, only return palettes that are
#'   colorblind-friendly. See [delphi_palette_colorblind()] for what that
#'   means.
#' @return A named list of character vectors containing hexadecimal colors.
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
        "{.arg colorblind_friendly} must be either {.val TRUE} or {.val FALSE}.",
        "i" = "See {.help [{.fun delphiPalettes::delphi_palettes}](delphiPalettes::delphi_palettes)} for usage."
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
        "{.arg category} must be a single, non-missing character string.",
        "i" = "See {.help [{.fun delphiPalettes::delphi_palettes}](delphiPalettes::delphi_palettes)} for available categories."
      )
    )
  }

  available <- unique(unname(categories))
  if (!category %in% available) {
    cli::cli_abort(
      c(
        "Unknown palette category {.val {category}}.",
        "i" = "Available categories: {.val {available}}.",
        "i" = "See {.help [{.fun delphiPalettes::delphi_palettes}](delphiPalettes::delphi_palettes)} for usage."
      )
    )
  }

  result[categories[names(result)] == category]
}
