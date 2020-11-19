#' @include checkers.R utils.R
#' 
#' Fertizer Measurements Class
#' 
#' @description Class to represent fertilizer measurements data from AgroFIMS. It inherents from AgAPI client class 
#' all the basic parameters and methods.
#'
#' @title AgFertilizerMea
#'
#' @docType class
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
#' @field endPoint specifies the end point value,   tableName/method.php 
#' @importFrom R6 R6Class
#' 
#' @export
#' 
AgFertilizerMea <- R6::R6Class(
  
  classname = "AgFertilizerMea",
  inherit = AgAPIClient,
  # private = list(
  #   super$endPoint = "/exp-site/getAll?id="
  # ),
  
  public = list(
    
    initialize = function(user=NULL, password=NULL, authentication=NULL, token=NULL, user_agent=NULL,
                          serverURL, version ){ #, endPoint) {
      super$initialize(user, password, authentication, token, user_agent, serverURL, version)#, endPoint)
    },
    
    #ag_get_fertmea_studyId = function(studyDbId, format, ...){},
    ag_get_fertmea_sitecropId = function(siteCropDbId, format, ...){} ,
    ag_get_fertmea_expsiteId = function(expsiteDbId, format, ...){}
    
  )
)

#############################################

#' @title  Get all fertilizer measurements based on the experiment site ID
#' @description retrieve fertilizer measurements data from AGROFIMS database. These measurements includes fertilizer products and nutrients elements. 
#' AGROFIMS use the AgAPI standard in order to get and post data.
#' @field ... argument inherents by AgaAPIClient
#' @field siteCropDbId character siteCropId its the id of the fertilizer evaluated in one site and experiment
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgFertilizerMea$set(which = "public", name = "ag_get_fertmea_expsiteId", 
              function( expsiteDbId =NULL,
                        format=c("json","list","data.frame"),
                        ... ){  
                
                super$endPoint <- "/crop-fertilizer/getAll?id="
                url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
                print(url)
                
                #GET parameters for retrieving data ----------------------------
                #headerParams <- character()
                queryParams <- list(id = expsiteDbId)  
                
                #Iterate over exp_site_id to extract experiment descript from each site in the study
                
                res <- self$call_api(
                  url = url, 
                  method = "GET",
                  queryParams = queryParams, #, #TODO
                  #headerParams = headerParams, #TODO
                  #body = body,
                  ...
                )    
                cont <- httr::content(res, as = "text", encoding = "UTF-8")
                #Object structure
                if(format=="json"){
                  out <-  cont
                } else if(format=="list"){
                  out <- jsonlite::fromJSON(cont,simplifyVector = "vector")
                } else if(format=="data.frame") {
                  out <- as_data_frame_agapi(cont)
                }
                
                return(out)
                
              },
overwrite = TRUE)   









