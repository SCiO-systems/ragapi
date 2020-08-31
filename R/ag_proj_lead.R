#' @include checkers.R utils.R

#' Project Lead Class
#' 
#' @description Subclass for representing agronomic project lead data. It inherents from AgAPI client class 
#' all the basic parameters and methods.
#'
#' @title AgProjEntity
#'
#' @docType class
#'
#' @usage $ag_projlead(studyDbId= 78, format="json")
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
#' @field serverURL specifies the password, defaults to 
#'                  http://research.cip.cgiar.org/agrofims/api/dev/
#' @field version specifies the version, defaults to 0051
#  @field endPoint specifies the end point value,   tableName/method.php 
#' @importFrom R6 R6Class
#' 
#' @export
#' 
AgProjLead <- R6::R6Class(
  
  classname = "AgProjLead",
  inherit = AgAPIClient,
  
  public = list(
    
    initialize = function(user=NULL, password=NULL, authentication=NULL, token=NULL, user_agent=NULL,
                          serverURL, version){ #, endPoint) {
      super$initialize(user, password, authentication, token,user_agent, serverURL, version)#, endPoint)
    },
    
    ag_get_projlead_studyId = function(studyDbId, format,...){}
  )
)

#' @title  Get all experimental details information by its agronomical study database ID
#' @description retrieve data from databases with AgAPI standard
#' @field studyDbID character agronomical study id
#' @field format support in three data structures: json, list and data.frames
#' @field ... argument inherents by AgaAPIClient
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
#' 
AgProjLead$set(which = "public", name = "ag_get_projlead_studyId",  function(studyDbId =NULL,
                                                                         format=c("json","list","data.frame"),
                                                                          ...){
  
  format <- match.arg(format)
  
  #url  <- paste0(self$serverURL, self$version, self$endPoint) #everything before the URL
  #print(url)
  super$endPoint <- "/proj-lead/getAll?id="
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
    out <- jsonlite::prettify(txt = cont) #jsonlite::fromJSON(cont)
  } else if(format=="data.frame") {
    out <- as_data_frame_agapi(cont)
    #cont <- jsonlite::fromJSON(cont)
    #out <- replace_null(cont,"") %>% as.data.frame(stringsAsFactors=FALSE) %>% tibble::rownames_to_column()
  }
  return(out)
}, overwrite = TRUE)   


# #Example
# #Experimenta details
# 
# expdetail_v0118 <- AgProjLead$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#                                     version ="/0135/r", endPoint= "/proj-lead/get.php")
# out_test <- expdetail_v0118$ag_projlead( studyDbId= 6, format="data.frame")





