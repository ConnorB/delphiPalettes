# delphi_palettes returns a well-formed collection

    Code
      delphi_palettes(1)
    Condition
      Error in `delphi_palettes()`:
      ! `category` must be a single, non-missing character string.
      i See `delphiPalettes::delphi_palettes()` (`?delphiPalettes::delphi_palettes()`) for available categories.

---

    Code
      delphi_palettes("unknown")
    Condition
      Error in `delphi_palettes()`:
      ! Unknown palette category "unknown".
      i Available categories: "classic", "nature", "keycaps", "vintage", "modern", "bold", "soft", "monochrome", "seasonal", and "artistic".
      i See `delphiPalettes::delphi_palettes()` (`?delphiPalettes::delphi_palettes()`) for usage.

# delphi_palettes(colorblind_friendly = TRUE) filters consistently with delphi_palette_colorblind()

    Code
      delphi_palettes(colorblind_friendly = "yes")
    Condition
      Error in `delphi_palettes()`:
      ! `colorblind_friendly` must be either "TRUE" or "FALSE".
      i See `delphiPalettes::delphi_palettes()` (`?delphiPalettes::delphi_palettes()`) for usage.

# delphi_palette_colorblind reports known friendly and unfriendly palettes

    Code
      delphi_palette_colorblind("unknown")
    Condition
      Error in `delphi_palette_colorblind()`:
      ! `name` must be a valid Delphi palette name.
      i Run `delphi_palettes()` for available names.

# delphi_palette retrieves and interpolates palettes

    Code
      delphi_palette(1)
    Condition
      Error in `delphi_palette()`:
      ! `name` must be a valid Delphi palette name.
      i Run `delphi_palettes()` for available names.

---

    Code
      delphi_palette("unknown")
    Condition
      Error in `delphi_palette()`:
      ! `name` must be a valid Delphi palette name.
      i Run `delphi_palettes()` for available names.

---

    Code
      delphi_palette("pride", n = 7)
    Condition
      Error in `delphi_palette()`:
      ! Palette "pride" has only 6 colors.
      i See `delphiPalettes::delphi_palette()` (`?delphiPalettes::delphi_palette()`) for continuous interpolation.

---

    Code
      delphi_palette(direction = 0)
    Condition
      Error in `delphi_palette()`:
      ! `direction` must be either "1" or "-1".
      i See `delphi_palette()` (`?delphiPalettes::delphi_palette()`) for palette options.

---

    Code
      delphi_palette(type = "other")
    Condition
      Error in `delphi_palette()`:
      ! `type` must be either "discrete" or "continuous".
      i See `delphiPalettes::delphi_palette()` (`?delphiPalettes::delphi_palette()`) for palette options.

# continuous type requires n and preserves alpha

    Code
      delphi_palette("mayfair", type = "continuous")
    Condition
      Error in `delphi_palette()`:
      ! `n` is required when `type = "continuous"`.
      i See `delphiPalettes::delphi_palette()` (`?delphiPalettes::delphi_palette()`) for palette options.

# print_delphi_palettes errors when no palette matches the filters

    Code
      print_delphi_palettes("classic", colorblind_friendly = TRUE)
    Condition
      Error in `print_delphi_palettes()`:
      ! No palettes match `category` and `colorblind_friendly`.

