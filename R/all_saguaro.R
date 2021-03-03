#' Display all color palettes
#'
#' @export
#' @importFrom gridExtra grid.arrange
#' @return An image of all the color palettes in saguaRo
#'
all_saguaro <- function() {
  p1 <- display_bars("bloom")
  p2 <- display_bars("bugs")
  p3 <- display_bars("coyote")
  p4 <- display_bars("gila")
  p5 <- display_bars("gopher")
  p6 <- display_bars("mariposa")
  p7 <- display_bars("oriole")

  grid.arrange(p1, p2, p3, p4,
               p5, p6, p7,
               ncol = 2)
}
