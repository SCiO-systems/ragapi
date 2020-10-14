#' @include checkers.R utils.R
#' 
#' Experimental Designs Class
#' 
#' @description Class to represent experimental designs matrix and data from AgroFIMS. It inherents from AgAPI client class 
#' all the basic parameters and methods.
#'
#' @title AgExpDesign
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
AgExpDesign <- R6::R6Class(
  
  classname = "AgExpDesign",
  inherit = AgAPIClient,
  # private = list(
  #   super$endPoint = "/exp-site/getAll?id="
  # ),
  
  public = list(
    
    initialize = function(user=NULL, password=NULL, authentication=NULL, token=NULL, user_agent=NULL,
                          serverURL, version ){ #, endPoint) {
      super$initialize(user, password, authentication, token, user_agent, serverURL, version)#, endPoint)
    },
    
    ag_get_edsexp_expsiteId = function(expsiteDbId, format, ...){},
    ag_get_edsfactor_expsiteId = function(expsiteDbId, format, ...){},
    ag_get_edsfert_expsiteId = function(expsiteDbId, format, ...){}
  )
)



#############################################


#' @title  Get all data from an experimetal design information based on experiment site ID (expsiteDbId)
#' @description retrieve data from databases with AgAPI standard
#' @field ... argument inherents by AgaAPIClient
#' @field expsiteDbId character experiment site ID
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @example \dontrun{
#' sc <- AgExpDesign$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", version = "/0233/r")
#' out <- sc$ag_get_edsinfo_expsiteId(expsiteDbId = 5,
#'                                       format = "data.frame")
#' }
#' @export 
#' 
AgExpDesign$set(which = "public", name = "ag_get_edsinfo_expsiteId", 
              function(expsiteDbId =NULL,
                       format=c("json","list","data.frame"),
                        ... ){  
                
                super$endPoint <- "/site-design/get?id="
                url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL

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
                  out <- as_data_frame_agexpdetails(cont)
                }
                
                return(out)
              },
overwrite = TRUE)   



#############################################

#' @title  Get all factors of experimetanl designs based on the experiment site ID (expsiteDbId)
#' @description Retrieve factors of experimental designs from AGROFIMS database. AGROFIMS use the AgAPI standard in order to get and post data.
#' @field ... argument inherents by AgaAPIClient
#' @field expsiteDbId character experiment site ID
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @example \dontrun{
#' sc <- AgExpDesign$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", version = "/0233/r")
#' out <- sc$ag_get_edsfactors_expsiteId(expsiteDbId = 5,
#'                                       format = "data.frame")
#' out <- sc$ag_get_edsfactors_expsiteId(expsiteDbId = 6,
#'                                       format = "data.frame")
#' }
#' @export 
#' 
AgExpDesign$set(which = "public", name = "ag_get_edsfactors_expsiteId", 
                function(expsiteDbId =NULL,
                         format=c("json","list","data.frame"),
                         ... ){  
               
                  super$endPoint <- "/site-factor/getAll?id="
                  url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL

                  
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

