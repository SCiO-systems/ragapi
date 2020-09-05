#' @importFrom dplyr %>%
#' @export
dplyr::`%>%`

utils::globalVariables(c("."))



#' @title Replace null values
#' @description replace null values in a list or data.frame
#' @param .data
#' 
#' 

replace_null <-  function(.data, replacement = ""){
  
  out <- sapply(.data, function(x) ifelse(is.null(x), replacement, x))
  
}


#' @title Convert HTTP responses to AgExpDetails class data
#' @description The GET method retrieve a list of values (list data structure), some of them with NULL values,
#' should be converted to data frame structure.
#' @param .data
#' @export
#' 
as_data_frame_agexpdetails <-  function(.data){
  
  cont <- jsonlite::fromJSON(.data) 
  out <- replace_null(cont,"") %>% 
                      as.data.frame(stringsAsFactors=FALSE) %>% 
                      tibble::rownames_to_column()
  #cont <- jsonlite::fromJSON(json) 
  #out <- sapply(.data, function(x) ifelse(is.null(x), replacement, x))
}


#' @title AgExpDetails as.data.frame
#' @description Coerce AgExpDetails responses to data.frame
#'
#' @section R6 Usage: $as_data_frame_agapi(.data)
#' @param object AgExpDetails.
#' @param ... additional arguments.
#'
#' @seealso \code{\link{AgExpDetails}}
#'
#' @returnd data.frame of the response.
#'
#' @export
#'  
as_data_frame_agapi <-  function(.data, tranpose = FALSE){
  
  if(class(.data)=="AgExpDetails"){
    cont <- jsonlite::fromJSON(.data) 
    out <- replace_null(cont,"") %>% 
      as.data.frame(stringsAsFactors=FALSE) %>% 
      tibble::rownames_to_column()
    
  }else {
    cont <- jsonlite::fromJSON(.data) 
    if(length(cont)==0){
      out <- data.frame()
    }else if(nrow(cont)>=1){
      out <- cont
    }    
  }
  out
}








#' @title Error handling in API's responses
#' @description  
#' @references See reference in https://github.com/ropensci/ckanr/blob/c5d5bc32be76d3b6447807adc1501803aeeaefa3/R/zzz.R

err_handler <- function(x) {
  if (x$status_code > 201) {
    obj <- try({
      err <- jsonlite::fromJSON(x$parse("UTF-8"))$error
      tmp <- err[names(err) != "__type"]
      errmsg <- paste(names(tmp), unlist(tmp[[1]]))
      list(err = err, errmsg = errmsg)
    }, silent = TRUE)
    if (!inherits(obj, "try-error")) {
      stop(sprintf("%s - %s\n  %s",
                   x$status_code,
                   obj$err$`__type`,
                   obj$errmsg),
           #obj$err$message),
           call. = FALSE)
    } else {
      obj <- {
        err <- x$status_http()$message
        errmsg <- x$parse("UTF-8")
        list(err = err, errmsg = errmsg)
      }
      stop(sprintf("%s - %s\n  %s",
                   x$status_code,
                   obj$err,
                   obj$errmsg),
           call. = FALSE)
    }
  } else{
    print("Status 200: OK. We received the request")
  }
}


