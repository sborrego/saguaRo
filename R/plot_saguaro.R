#' Makes simple graphs to visual available color palettes in saugaRo.
#'
#' @export
#' @import ggplot2
#' @importFrom packcircles circleProgressiveLayout circleLayoutVertices
#' @importFrom grDevices colorRampPalette
#' @param name The name of color palette in saugaRo. Use `names(saugaro_pal)`
#' to list all valid names.
#' @param plot The name of pre-made plot to visualize indicated color palette.
#' Valid options are: box, circle, density, gradient.
#' @param n An integer limiting the number of colors used from the selected
#' color palette.
#' @examples plot_saguaro()
#' @examples plot_saguaro("oriole", "gradient")
#' @examples plot_saguaro("mariposa", "density")
#' @examples plot_saguaro(plot = "circle")
#' @examples plot_saguaro(n = 3)
#'

plot_saguaro <- function(name = "bloom",
                         plot = "box",
                         n = length(saguaro(name))) {
  pal <- saguaro(name, n)
  plot_names <- c("box", "gradient", "hex", "density")

  if (missing(plot)) {
    warning(
      "Plot type was not provided. Valid options include: box, circle, density, gradient, hex",
      paste("\n Returning boxplot using", name,
            "color palette",  sep = " ")
    )
    return(boxplot(box_data[, 1:length(pal)],
                   col = pal,
                   main = name))
  } else if (plot == "box") {
    boxplot(box_data[, 1:length(pal)],
            col = pal,
            main = name)
  } else if (plot == "circle") {
    circle_data <- data.frame(group = LETTERS[1:20],
                              value = sample(seq(1, 100), 20))

    packing <-
      circleProgressiveLayout(circle_data$value,
                              sizetype = 'area')
    packing$radius <- 0.95 * packing$radius
    circle_data <- cbind(circle_data, packing)
    dat.gg <- circleLayoutVertices(packing, npoints = 50)
    my_col <- colorRampPalette(saguaro(name))(20)

    ggplot() +
      geom_polygon(
        data = dat.gg,
        aes(x, y, group = id, fill = as.factor(id)),
        colour = "black",
        alpha = 0.7
      ) +
      scale_fill_manual(values = my_col) +
      geom_text(data = circle_data,
                aes(x, y, size = value, label = group),
                color = "black") +
      theme_void() +
      theme(legend.position = "none") +
      coord_equal()
  } else if (plot == "density") {
    ggplot(mpg, aes(cty)) +
      geom_density(aes(fill = factor(cyl)),
                   alpha = 0.8) +
      scale_fill_manual(values = saguaro(name)) +
      labs(
        title = "Density plot",
        subtitle = "City Mileage Grouped by Number of cylinders",
        x = "City Mileage",
        fill = "# Cylinders"
      )
  } else if (plot == "gradient") {
    data(mtcars)
    ggplot(mtcars, aes(x = wt, y = mpg, fill = mpg)) +
      geom_point(shape = 21,
                 size = 5,
                 color = "gray48") +
      scale_fill_gradientn(colors = pal) +
      theme_bw() +
      ggtitle(name)
  } else if (!(name %in% plot_names)) {
    warning(
      "Plot type is not valid. Options include: box, gradient, hex, density",
      paste("\n Returning boxplot using", name,
            "color palette",  sep = " ")
    )
    return(boxplot(box_data[, 1:length(pal)],
                   col = pal,
                   main = name))
  } else {
    return("see warning")
  }
}
