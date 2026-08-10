# delphi_palettes returns a well-formed collection

    Code
      delphi_palettes(1)
    Condition
      Error in `delphi_palettes()`:
      ! `category` must be one character string. It cannot be missing.
      i Read `delphiPalettes::delphi_palettes()` (`?delphiPalettes::delphi_palettes()`) for available categories.

---

    Code
      delphi_palettes("unknown")
    Condition
      Error in `delphi_palettes()`:
      ! Unknown palette category "unknown".
      i Available categories: "classic", "nature", "keycaps", "vintage", "modern", "bold", "soft", "monochrome", "seasonal", and "artistic".
      i Read `delphiPalettes::delphi_palettes()` (`?delphiPalettes::delphi_palettes()`) for details.

# delphi_palettes(colorblind_friendly = TRUE) filters consistently with delphi_palette_colorblind()

    Code
      delphi_palettes(colorblind_friendly = "yes")
    Condition
      Error in `delphi_palettes()`:
      ! `colorblind_friendly` must be "TRUE" or "FALSE".
      i Read `delphiPalettes::delphi_palettes()` (`?delphiPalettes::delphi_palettes()`) for details.

# delphi_palette_colorblind reports known friendly and unfriendly palettes

    Code
      delphi_palette_colorblind("unknown")
    Condition
      Error in `delphi_palette_colorblind()`:
      ! `name` must be the name of a Delphi palette.
      i Run `delphi_palettes()` for available names.

# delphi_palette retrieves and interpolates palettes

    Code
      delphi_palette(1)
    Condition
      Error in `delphi_palette()`:
      ! `name` must be the name of a Delphi palette.
      i Run `delphi_palettes()` for available names.

---

    Code
      delphi_palette("unknown")
    Condition
      Error in `delphi_palette()`:
      ! `name` must be the name of a Delphi palette.
      i Run `delphi_palettes()` for available names.

---

    Code
      delphi_palette("pride", n = 7)
    Condition
      Error in `delphi_palette()`:
      ! Palette "pride" contains only 6 colors.
      i Read `delphiPalettes::delphi_palette()` (`?delphiPalettes::delphi_palette()`) to interpolate colors.

---

    Code
      delphi_palette(direction = 0)
    Condition
      Error in `delphi_palette()`:
      ! `direction` must be "1" or "-1".
      i Read `delphi_palette()` (`?delphiPalettes::delphi_palette()`) for palette options.

---

    Code
      delphi_palette(type = "other")
    Condition
      Error in `delphi_palette()`:
      ! `type` must be "discrete" or "continuous".
      i Read `delphiPalettes::delphi_palette()` (`?delphiPalettes::delphi_palette()`) for palette options.

# continuous type requires n and preserves alpha

    Code
      delphi_palette("mayfair", type = "continuous")
    Condition
      Error in `delphi_palette()`:
      ! `n` is required for `type = "continuous"`.
      i Read `delphiPalettes::delphi_palette()` (`?delphiPalettes::delphi_palette()`) for palette options.

# print_delphi_palettes errors when no palette matches the filters

    Code
      print_delphi_palettes("classic", colorblind_friendly = TRUE)
    Condition
      Error in `print_delphi_palettes()`:
      ! No palette matches `category` and `colorblind_friendly`.

