#' Report palette color vision support
#'
#' Reports whether a palette keeps every distinct color pair under simulated
#' deuteranopia, protanopia, and tritanopia. The package stores this result for
#' each palette. [colorblindcheck::palette_check()] creates the results in
#' `data-raw/palettes.R`.
#'
#' @param name A single palette name. Use [delphi_palettes()] to get palette
#'   names.
#' @return `TRUE` or `FALSE`.
#' @export
#' @examples
#' delphi_palette_colorblind("dove")
#' delphi_palette_colorblind("pinata")
delphi_palette_colorblind <- function(name) {
  name <- .delphi_palette_name(name)
  unname(colorblind_friendly_lookup[[name]])
}
