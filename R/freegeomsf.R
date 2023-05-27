
## function to scale a sfc so that ever sfg fits in unit square 0,1 0,1
scl1 <- function(x) {
  sfg <- FALSE
  if (inherits(x, "sfg")) {
    sfg <- TRUE
    x <- sf::st_sfc(x)
  }
  ex <-  attr(x, "bbox")[c(1L, 3L, 2L, 4L)]
  rat <- 1/diff(ex)[c(1, 3)]
  x <- (x - ex[c(1, 3)]) * matrix(c(rat[1], 0, 0, rat[2]), 2L)
  if (sfg) {
    sfg <- x[[1]]
  }
  x
}


#' Rescale sf geometry for ggplot2 "free scales"
#'
#' Rescales sf geometries locally, to get around the preclusion of free scales
#' in ggplot2 faceting.
#'
#' Because we can only simulate free scales, we can't carry the real world axes
#' to the plot (well it might be possible ...).
#'
#'
#' In future we might separate x and y, currently we rescale each geometry to the
#' unit square. We can't group the scaling atm, each one is done individually to its
#' own local range.
#'
#' @param x sf object
#' @param ... ignored for now
#'
#' @return sf object, with each element scale to unit square
#' @export
#'
#' @examples
#' data(sfx)
#' freegeomsf(sfx[1:15, ])
freegeomsf <- function(x, ...) {
  sfx <- sf::st_geometry(x)
  sfx <- do.call(c, lapply(sfx,scl1))
  x <- sf::st_set_geometry(x, sfx)
  x
}

