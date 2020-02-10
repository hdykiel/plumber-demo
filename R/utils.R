# R functions

echo <- function(msg = "") {
  list(message = paste0("The message is '", msg, "'"))
}

diamonds_plot <- function(data, facet = NULL) {
  p <- ggplot2::ggplot(data, ggplot2::aes(x = carat, y = price)) +
    ggplot2::geom_point() +
    ggplot2::geom_smooth(method = "lm") +
    ggplot2::scale_y_continuous(labels = scales::dollar) +
    ggplot2::theme_bw() +
    ggplot2::labs(title = "Diamond Price by Carat",
                  x = "Carat",
                  y = "Price")
  
  if (!is.null(facet)) {
    p <- p + ggplot2::facet_wrap(paste0("~", facet))
  }
  
  p
}
