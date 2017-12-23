#' Fishbase API versions
#' 
#' @export
#' @param server base URL to the FishBase API (by default). For SeaLifeBase, use https://fishbase.ropensci.org/sealifebase
#' @param ... additional arguments to httr::GET
#' @return a list
#' @examples
#' \dontrun{
#' versions()
#' }
versions <- function(server = getOption("FISHBASE_API", FISHBASE_API), ...) {  
  resp <- httr::GET(paste0(server, "/versions"), httr::user_agent(make_ua()), ...)
  httr::stop_for_status(resp)
  res <- httr::content(resp, "text", encoding = "UTF-8")
  jsonlite::fromJSON(res)$data
}
