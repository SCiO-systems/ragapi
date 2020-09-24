###########################################################################3
# HAS and CHECK are user main verbs for quality checks in agapi calls
#
###########################################################################

#' @title
#' agapi_canInternet
#'
#' @description
#' Check for internet connection.
#' @param url character; A url to check. Default is \href{https://www.google.com}{www.google.com}.
#' @return NULL when internet access is available or ERROR when internet access is not available
#' @author Omar Benites
#' @references \href{http://stackoverflow.com/questions/5076593/how-to-determine-if-you-have-an-internet-connection-in-r}{Stack Overflow} and \code{\link[curl]{has_internet}}
#' @family agapi_helpers
#' @importFrom curl nslookup
#'
#' @export

has_internet <- function(url = "www.google.com.pe") {

  stopifnot(is.character(url))
  return(invisible(curl::nslookup(host = url)))

}

#' @title Validation of URL via curl
#' @param url url
#'
check_url <- function(url){
  curl::curl_fetch_memory(url)
  
}


##tryCatch
log_calculator <- function(x){
  tryCatch(
    expr = {
      message(log(x))
      message("Successfully executed the log(x) call.")
    },
    error = function(e){
      message('Caught an error!')
      print(e)
    },
    warning = function(w){
      message('Caught an warning!')
      print(w)
    },
    finally = {
      message('All done, quitting.')
    }
  )    
}


#' @param x list or list of lists 
#' @author Omar Benites
#' @description Check if there are nulls in the a list or list of lists 
#' 

check_list_null <- function(x){
  a1 <- NULL
  sapply(a1, is.null)
  
  
}
