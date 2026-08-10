known_categories <- c(
  "classic",
  "nature",
  "keycaps",
  "vintage",
  "modern",
  "bold",
  "soft",
  "monochrome",
  "seasonal",
  "artistic"
)

test_that("delphi_palettes returns a well-formed collection", {
  palettes <- delphi_palettes()

  expect_type(palettes, "list")
  expect_gt(length(palettes), 0)
  expect_equal(length(unique(names(palettes))), length(palettes))
  expect_true(all(vapply(palettes, is.character, logical(1))))
  expect_true(all(vapply(palettes, function(x) length(x) >= 3, logical(1))))
  expect_true(all(grepl(
    "^#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$",
    unlist(palettes)
  )))

  expect_equal(
    palettes$mayfair,
    c("#1a2634", "#2d4a3e", "#6b1c2a", "#c9b896", "#f5f0e6")
  )

  for (category in known_categories) {
    result <- delphi_palettes(category)
    expect_gt(length(result), 0)
    expect_true(all(names(result) %in% names(palettes)))
  }

  expect_snapshot(error = TRUE, delphi_palettes(1))
  expect_snapshot(error = TRUE, delphi_palettes("unknown"))
})

test_that("every palette belongs to exactly one known category", {
  by_category <- unlist(
    lapply(known_categories, delphi_palettes),
    recursive = FALSE
  )

  # Catches palette/category lists drifting out of sync: `delphi_palettes()`
  # indexes a logical vector built from the category lookup, so a palette
  # missing from that lookup silently recycles the index instead of erroring.
  expect_setequal(names(by_category), names(delphi_palettes()))
  expect_equal(length(by_category), length(delphi_palettes()))
})

test_that("delphi_palettes(colorblind_friendly = TRUE) filters consistently with delphi_palette_colorblind()", {
  all_palettes <- delphi_palettes()
  friendly_palettes <- delphi_palettes(colorblind_friendly = TRUE)

  # A genuine filter: some palettes are friendly, some aren't.
  expect_gt(length(friendly_palettes), 0)
  expect_lt(length(friendly_palettes), length(all_palettes))

  is_friendly <- vapply(
    names(all_palettes),
    delphi_palette_colorblind,
    logical(1)
  )
  expect_setequal(names(friendly_palettes), names(all_palettes)[is_friendly])

  expect_snapshot(error = TRUE, delphi_palettes(colorblind_friendly = "yes"))
})

test_that("colorblind_friendly combines with category filtering", {
  friendly_nature <- delphi_palettes("nature", colorblind_friendly = TRUE)

  expect_true(all(names(friendly_nature) %in% names(delphi_palettes("nature"))))
  expect_true(all(vapply(
    names(friendly_nature),
    delphi_palette_colorblind,
    logical(1)
  )))
})

test_that("every palette has a colorblind-friendliness verdict", {
  # Guards against palette/colorblind_friendly_lookup drift independently of
  # delphi_palette_colorblind(), which is itself defined in terms of
  # delphi_palettes(colorblind_friendly = TRUE) and so can't catch this on
  # its own. A palette missing from the lookup would index as NA and
  # silently produce a NULL list element rather than an error.
  friendly_palettes <- delphi_palettes(colorblind_friendly = TRUE)

  expect_true(all(vapply(friendly_palettes, is.character, logical(1))))
  expect_false(any(vapply(friendly_palettes, is.null, logical(1))))
})

test_that("delphi_palette_colorblind reports known friendly and unfriendly palettes", {
  expect_true(delphi_palette_colorblind("dove"))
  expect_false(delphi_palette_colorblind("pinata"))
  expect_snapshot(error = TRUE, delphi_palette_colorblind("unknown"))
})

test_that("delphi_palette retrieves and interpolates palettes", {
  expect_equal(delphi_palette(), delphi_palette("mayfair"))
  expect_snapshot(error = TRUE, delphi_palette(1))
  expect_equal(
    delphi_palette("pride", n = 3),
    c("#e40303", "#ff8c00", "#ffed00"),
    ignore_attr = TRUE
  )
  expect_equal(
    delphi_palette("pride", direction = -1),
    rev(as.character(delphi_palette("pride"))),
    ignore_attr = TRUE
  )
  expect_length(delphi_palette("pride", n = 8, type = "continuous"), 8)
  expect_snapshot(error = TRUE, delphi_palette("unknown"))
  expect_snapshot(error = TRUE, delphi_palette("pride", n = 7))
  expect_snapshot(error = TRUE, delphi_palette(direction = 0))
  expect_snapshot(error = TRUE, delphi_palette(type = "other"))
})

test_that("direction is applied to the full palette before n subsets it", {
  full <- delphi_palette("pride")

  # n colors with direction = -1 are the *last* n colors of the original
  # order, reversed -- not the first n colors reversed.
  expect_equal(
    delphi_palette("pride", n = 3, direction = -1),
    rev(utils::tail(full, 3)),
    ignore_attr = TRUE
  )
})

test_that("continuous type requires n and preserves alpha", {
  expect_snapshot(error = TRUE, delphi_palette("mayfair", type = "continuous"))

  discrete <- delphi_palette("glassmorphism")
  continuous <- delphi_palette("glassmorphism", n = 6, type = "continuous")

  expect_length(continuous, 6)
  expect_true(all(nchar(continuous) == 9L))
  expect_equal(substr(continuous[1], 8, 9), substr(discrete[1], 8, 9))
})

test_that("direction and continuous interpolation combine sensibly", {
  forward <- delphi_palette("pride", n = 8, type = "continuous")
  reversed <- delphi_palette(
    "pride",
    n = 8,
    type = "continuous",
    direction = -1
  )

  # `colorRampPalette()`'s interpolation isn't perfectly symmetric under
  # reversal (off-by-one rounding in individual RGB channels), so compare
  # with a small tolerance rather than exact equality.
  diff <- abs(
    t(grDevices::col2rgb(reversed)) - t(grDevices::col2rgb(rev(forward)))
  )
  expect_true(max(diff) <= 1)
})

test_that("print_delphi_palette draws and returns a palette", {
  path <- tempfile(fileext = ".pdf")
  grDevices::pdf(path)
  on.exit(grDevices::dev.off(), add = TRUE)

  palette <- delphi_palette("mayfair")
  expect_type(palette, "character")
  expect_null(attributes(palette))
  expect_identical(print_delphi_palette("mayfair"), palette)
})

test_that("print_delphi_palettes draws a grid and returns the palette names", {
  path <- tempfile(fileext = ".pdf")
  grDevices::pdf(path)
  on.exit(grDevices::dev.off(), add = TRUE)

  expect_identical(
    print_delphi_palettes("keycaps"),
    names(delphi_palettes("keycaps"))
  )
  expect_identical(
    print_delphi_palettes(colorblind_friendly = TRUE),
    names(delphi_palettes(colorblind_friendly = TRUE))
  )
  # Doesn't error on direction, and doesn't leak par() settings.
  before <- graphics::par("mfrow")
  print_delphi_palettes("soft", direction = -1)
  expect_identical(graphics::par("mfrow"), before)
})

test_that("print_delphi_palettes splits the full collection by category", {
  pages <- delphiPalettes:::.delphi_palette_pages(
    delphi_palettes(),
    NULL,
    paginate = TRUE
  )

  expect_identical(names(pages), known_categories)
  expect_identical(
    unname(unlist(lapply(pages, names))),
    names(delphi_palettes())
  )
  expect_identical(
    delphiPalettes:::.delphi_palette_pages(
      delphi_palettes("nature"),
      "nature",
      paginate = TRUE
    ),
    list(nature = delphi_palettes("nature"))
  )
  expect_identical(
    delphiPalettes:::.delphi_palette_pages(
      delphi_palettes(colorblind_friendly = TRUE),
      NULL,
      paginate = FALSE
    ),
    list(delphi_palettes(colorblind_friendly = TRUE))
  )
})

test_that("print_delphi_palettes errors when no palette matches the filters", {
  path <- tempfile(fileext = ".pdf")
  grDevices::pdf(path)
  on.exit(grDevices::dev.off(), add = TRUE)

  # "classic" has zero colorblind-friendly palettes.
  expect_snapshot(
    error = TRUE,
    print_delphi_palettes("classic", colorblind_friendly = TRUE)
  )
})
