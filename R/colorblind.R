#' Check whether a palette is colorblind-friendly
#'
#' Checks whether a palette is colorblind-friendly. A palette is
#' colorblind-friendly when every color pair distinguishable in the
#' original palette remains distinguishable under simulated deuteranopia,
#' protanopia, and tritanopia, as determined by the \pkg{colorblindcheck}
#' package. Verdicts are precomputed and shipped with the package; see
#' `data-raw/colorblind-friendly.R` in the source repository to see how they
#' were generated or to regenerate them after a palette's colors change.
#'
#' @param name A single palette name, as returned by
#'   `names(delphi_palettes())`.
#' @return `TRUE` or `FALSE`.
#' @export
#' @examples
#' delphi_palette_colorblind("dove")
#' delphi_palette_colorblind("pinata")
delphi_palette_colorblind <- function(name) {
  name <- .delphi_palette_name(name)
  name %in% names(delphi_palettes(colorblind_friendly = TRUE))
}

