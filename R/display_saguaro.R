#' Display individual color palettes in saguaRo
#'
#' @export
#' @param name The name of color palette in saugaRo. Use `names(saugaro_pal)`
#' to list all valid names.
#' @examples display_saguaro("gila")
#'
display_saguaro <- function(name) {
  pal <- saguaro_pal[[name]]
  pal_names <- names(saguaro_pal)

  if (!(name %in% pal_names)) {
    warning(
      paste(name, "is not a valid color palette name for saguaRo. \n"),
      "Returning saguaRo color palette names."
    )
    return(names(saguaro_pal))
  }
  x <- 1:length(pal)
  y <- rep(1, length(pal))
  palette_dim <- data.frame("A" = x,
                            "B" = y)

  with(palette_dim, {
    symbols(
      A,
      B,
      circles = B / 2.25,
      inches = FALSE,
      bg = saguaro(name),
      fg = "white",
      main = name,
      xlab = " ",
      ylab = " ",
      xaxt = "n",
      yaxt = "n",
      bty = "n",
      cex = 0.8
    )
  })
}
