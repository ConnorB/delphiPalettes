test_that("scale_*_delphi_d maps discrete data to exact palette colors", {
  skip_if_not_installed("ggplot2")

  df <- data.frame(x = factor(seq_len(5)))
  p <- ggplot2::ggplot(df, ggplot2::aes(x, fill = x)) +
    ggplot2::geom_bar() +
    scale_fill_delphi_d("mayfair")
  built <- ggplot2::ggplot_build(p)

  expect_setequal(unique(built$data[[1]]$fill), delphi_palette("mayfair"))
})

test_that("scale_*_delphi_d interpolates when levels exceed the palette length", {
  skip_if_not_installed("ggplot2")

  # "pride" has 6 colors; 7 levels must be interpolated, not error.
  df <- data.frame(x = factor(seq_len(7)))
  p <- ggplot2::ggplot(df, ggplot2::aes(x, fill = x)) +
    ggplot2::geom_bar() +
    scale_fill_delphi_d("pride")

  expect_no_error(built <- ggplot2::ggplot_build(p))
  expect_length(unique(built$data[[1]]$fill), 7)
})

test_that("scale_*_delphi_d respects direction", {
  skip_if_not_installed("ggplot2")

  df <- data.frame(x = factor(seq_len(5)))
  build_fill <- function(direction) {
    p <- ggplot2::ggplot(df, ggplot2::aes(x, fill = x)) +
      ggplot2::geom_bar() +
      scale_fill_delphi_d("mayfair", direction = direction)
    ggplot2::ggplot_build(p)$data[[1]]$fill[order(df$x)]
  }

  expect_identical(build_fill(-1), rev(build_fill(1)))
})

test_that("scale_*_delphi_c builds a continuous gradient scale", {
  skip_if_not_installed("ggplot2")

  df <- data.frame(x = 1, y = 1, z = seq(0, 1, length.out = 20))
  p <- ggplot2::ggplot(df, ggplot2::aes(x, y, color = z)) +
    ggplot2::geom_point() +
    scale_color_delphi_c("mayfair")

  expect_s3_class(p$scales$scales[[1]], "ScaleContinuous")
  expect_no_error(ggplot2::ggplot_build(p))
})

test_that("scale_colour_* are aliases for scale_color_*", {
  skip_if_not_installed("ggplot2")

  expect_identical(scale_colour_delphi_d, scale_color_delphi_d)
  expect_identical(scale_colour_delphi_c, scale_color_delphi_c)
})

test_that("delphi ggplot2 scales validate name like the rest of the package", {
  skip_if_not_installed("ggplot2")

  expect_snapshot(error = TRUE, scale_fill_delphi_d("unknown"))
  expect_snapshot(error = TRUE, scale_color_delphi_c("unknown"))
})
