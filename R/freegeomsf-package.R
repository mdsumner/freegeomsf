#' @keywords internal
#' @aliases freegeomsf-package
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL


#' A sf  object
#'
#' Obtained from 'CGAZ' a multipolygon dataset of New Zealand convert to single
#' polygons, with a field 'a' on them which is just row number. The data frame
#' is sorted by descending "area" (i.e. the size of the polygon, not the actual
#' geographic area, but I expect the order would be the same in this case, just
#' not generally).
#'
#' See data-raw/ for the script to generate the sfx object.
#' @name sfx
#' @docType data
NULL
