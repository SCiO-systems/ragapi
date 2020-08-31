#' Experimental details client wrapper
#' 
#' @description wrapper function for ragapi.ag_experiment. objects 
#' @param ... inherents arguments from AgAPIClient class and Ag
#' @param studyDbId character agronomic study identifier from AGROFIMS database

ag_expdetails <- function(studyDbId =NULL,
                          format=c("json","list","data.frame"),
                          serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                          version ="/002/r", endPoint= "/experiment/get.php",
                          ...){
# ag_expdetails <- function(studyDbId, format=c("json","list","data.frame"),...){  
  
  
  sc <- AgExpDetails$new(serverURL = serverURL, version = version, endPoint = endPoint)
  out <- sc$ag_expdetails(studyDbId = studyDbId,
             format = format,
             ...
             )
  
  return(out)
    
}
#Example of ag_expdetails 
# ag_expdetails(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#               version ="/002/r", endPoint= "/experiment/get.php", 78, format="data.frame")


