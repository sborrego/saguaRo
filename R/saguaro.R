#' Makes the color palettes from saguaRo available as R palettes.
#'
#' @export
#' @importFrom grDevices col2rgb rgb
#' @param name The name of color palette in saguaRo. Use `names(saguaro_pal)`
#' to list all valid names.
#' @param n An integer limiting the number of colors used from the selected
#' color palette.
#' @examples saguaro("bloom")

saguaro <- function (name, n) {
  pal <- saguaro_pal[[name]]
  pal_names <- names(saguaro_pal)

  if (!(name %in% pal_names)) {
    stop(paste(name, "is not a valid color palette name for saguaRo \n"))
  }
  if (missing(n)) {
    n <- length(saguaro_pal[[name]])
  }
  if (n > length(pal)) {
    warning(
      "Requested number of colors is greater than palette length \n",
      "Try using a color interpolation function such as grDevices::colorRampPalette",
      paste("\n Returning palette with", length(pal),
            "colors \n", sep = " ")
    )
    return(saguaro(name,
                   length(pal)))
  }
  col_list <- col2rgb(pal[1:n])
  switch(name,
         rgb(col_list[1,],
             col_list[2,],
             col_list[3,],
             maxColorValue = 255))
}
