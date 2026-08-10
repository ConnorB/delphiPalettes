.delphi_palette_name <- function(name, call = rlang::caller_env()) {
  palette_names <- names(delphi_palettes())

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
      "{.arg name} must be a valid Delphi palette name.",
      "i" = "Run {.run [delphi_palettes()](delphiPalettes::delphi_palettes())} for available names."
    ),
    call = call
  )
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
        "{.arg direction} must be either {.val 1} or {.val -1}.",
        "i" = "See {.help [{.fun delphi_palette}](delphiPalettes::delphi_palette)} for palette options."
      ),
      call = call
    )
  }

  direction
}
