.delphi_palette_name <- function(name, call = rlang::caller_env()) {
  palette_names <- names(palettes)

  if (
    is.character(name) &&
      length(name) == 1L &&
      !is.na(name) &&
      name %in% palette_names
  ) {
    return(name)
  }

  cli::cli_abort(
    c(
      "{.arg name} must be the name of a Delphi palette.",
      "i" = "Run {.run [delphi_palettes()](delphiPalettes::delphi_palettes())} for available names."
    ),
    call = call
  )
}

.delphi_continuous_palette <- function(colors, n) {
  has_alpha <- any(nchar(colors) == 9L)
  grDevices::colorRampPalette(colors, alpha = has_alpha)(n)
}

.delphi_palette_direction <- function(direction, call = rlang::caller_env()) {
  if (
    !is.numeric(direction) ||
      length(direction) != 1L ||
      !is.finite(direction) ||
      !direction %in% c(-1, 1)
  ) {
    cli::cli_abort(
      c(
        "{.arg direction} must be {.val 1} or {.val -1}.",
        "i" = "Read {.help [{.fun delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
      ),
      call = call
    )
  }

  direction
}
