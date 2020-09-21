#' @include checkers.R utils.R

#' Agronomic Experimental Details Class
#' 
#' @description subclass for representing agronomic experimental details data. It inherents from AgAPI client class 
#' all the basic parameters and methods.
#'
#' @title AgExpDetails
#'
#' @docType class
#'
#' @usage ag_expdetails(studyDbId= 78, format="json")
#'
#' @format R6 class
#' 
#' @field user specifies the user name, defaults to NULL 
#' @field password specifies the password, defaults to NULL
#' @field user specifies the user name, defaults to NULL 
#' @field password specifies the password, defaults to NULL
#' @field authentication specifies the password, defaults to NULL
#' @field token specifies the password, defaults to NULL
#' @field user_agent specifies the password, defaults to NULL
#' @field serverURL specifies the password, defaults to http://research.cip.cgiar.org/agrofims/api/dev/
#' @field version specifies the version, defaults to 0051
#  @field endPoint specifies the end point value,   tableName/method.php 
#' @importFrom R6 R6Class
#' 
#' @export
#' 
AgExpDetails <- R6::R6Class(
  
  classname = "AgExpDetails",
  inherit = AgAPIClient,
  
  public = list(

     initialize = function(user=NULL, password=NULL, authentication=NULL, token=NULL, user_agent=NULL,
                           serverURL, version){ ###, endPoint){ ##  
        super$initialize(user, password, authentication, token,user_agent, serverURL, version) #, endPoint)
      },
      
     ag_get_expdetails_studyId = function(studyDbId, format,...){}
  )
)

#' @title  Get all experimental details information by its agronomical study database ID
#' @description retrieve data from databases with AgAPI standard
#' @field object AgAPI client object
#' @field ... argument inherents by AgaAPIClient
#' @field studyDbID character agronomical study id
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgExpDetails$set(which = "public", name = "ag_get_expdetails_studyId",  function(studyDbId =NULL,
                                                                     format=c("json","list","data.frame"),...){
  
  format <- match.arg(format)
  super$endPoint <- "/experiment/get?id="
  url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
  print(url)
  
  headerParams <- character()
  
  queryParams <- list(id = studyDbId) #everythig after the ? in the URL
  
  res <- self$call_api(
    url = url,
    method = "GET",
    queryParams = queryParams, #, #TODO
    #headerParams = headerParams, #TODO
    #body = body,
    ...
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8")
  
  if(format=="json"){
    out <-  cont
  } else if(format=="list"){
    out <- jsonlite::fromJSON(cont,simplifyVector = "vector")
  } else if(format=="data.frame") {
    out <- as_data_frame_agexpdetails(cont)
    #cont <- jsonlite::fromJSON(cont)
    #out <- replace_null(cont,"") %>% as.data.frame(stringsAsFactors=FALSE) %>% tibble::rownames_to_column()
  }
   
  return(out)
},
overwrite = TRUE)



