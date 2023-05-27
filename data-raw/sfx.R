## {dsn} is just a collection of online data sources
## pak::pak("hypertidy/dsn")
## get polygons
f <- function() {
  x <- sf::st_cast(sf::read_sf(dsn::CGAZ(), query = dsn::CGAZ_sql("New Zealand")), "POLYGON")
  x <- x[order(sf::st_area(sf::st_set_crs(x, NA)), decreasing = TRUE), ]
  x$a <- 1:nrow(x)
  x
}




sfx <- f()

usethis::use_data(sfx, overwrite = TRUE)
