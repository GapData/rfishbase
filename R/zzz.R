`%||%` <- function(x, y) {
  if (is.null(x) || length(x) == 0) y else x
}

#' @importFrom httr add_headers
ver_header <- function(x) {
  vers <- c('v1', 'v2', 'v3', 'v4')
  if (is.null(x)) x <- vers[length(vers)]
  if (!x %in% vers) {
    stop("version must be one of ", paste0(vers, collapse = ", "))
  }
  add_headers(Accept = sprintf("application/vnd.ropensci.%s+json", x))
}
