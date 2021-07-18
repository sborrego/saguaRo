#' Display individual color palettes in saguaRo
#'
#' @export
#' @import ggplot2
#' @param name The name of color palette in saguaRo. Use `names(saguaro_pal)`
#' to list all valid names.
#' @return An image of the requested color palette in saguaRo
#' @examples display_bars("bloom")
#' @examples display_bars("coyote")
#'
display_bars <- function(name) {
  qplot(
    x = 1:length(saguaro(name)),
    y = 0.2,
    fill = factor(1:length(saguaro(name))),
    geom = "tile"
  ) +
    scale_fill_manual(values = saguaro(name)) +
    theme_void() +
    labs(title = name) +
    theme(legend.position = "none",
          plot.title = element_text(size = 20,
                                    face = "bold"))
}
