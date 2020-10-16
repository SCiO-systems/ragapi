#' @include checkers.R utils.R
#' 
#' Crop Measurements Class
#' 
#' @description Class to represent crop measurements data from AgroFIMS. It inherents from AgAPI client class 
#' all the basic parameters and methods.
#'
#' @title AgCropMea
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
AgCropMea <- R6::R6Class(
  
  classname = "AgCropMea",
  inherit = AgAPIClient,
  # private = list(
  #   super$endPoint = "/exp-site/getAll?id="
  # ),
  
  public = list(
    
    initialize = function(user=NULL, password=NULL, authentication=NULL, token=NULL, user_agent=NULL,
                          serverURL, version ){ #, endPoint) {
      super$initialize(user, password, authentication, token, user_agent, serverURL, version)#, endPoint)
    },
    
    #ag_get_cropmea_studyId = function(studyDbId, format, ...){},
    ag_get_cropmea_sitecropId = function(siteCropDbId, format, ...){} ,
    ag_get_cropmea_expsiteId = function(expsiteDbId, format, ...){}
    
  )
)

#############################################

#' @title  Get all crop measurements based on the experiment site ID
#' @description retrieve crop measurements data from AGROFIMS database. AGROFIMS use the AgAPI standard in order to get and post data.
#' @field ... argument inherents by AgaAPIClient
#' @field siteCropDbId character siteCropId its the id of the crop evaluated in one site and experiment
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgCropMea$set(which = "public", name = "ag_get_cropmea_sitecropId", 
              function( siteCropDbId =NULL,
                        format=c("json","list","data.frame"),
                        ... ){  
                
                super$endPoint <- "/crop-measurement/getAll?id="
                url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
                print(url)
                
                #GET parameters for retrieving data ----------------------------
                #headerParams <- character()
                queryParams <- list(id = siteCropDbId)  
                
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
                  out <- ragapi::as_data_frame_agapi(cont)
                }
                
                return(out)
                
              },
              
overwrite = TRUE)   


##TODO: agregar un metodo para sacar los measurementes de un sitio-fieldbook


#############################################

#' @title  Get all crop measurements based on the agronomic experiment site database ID
#' @description retrieve crop measurements data from AGROFIMS database with AgAPI standard
#' @field ... argument inherents by AgaAPIClient
#' @field expsiteDbId character agronomical study id
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgCropMea$set(which = "public", name = "ag_get_cropmea_expsiteId", 
              function(expsiteDbId =NULL,
                       format=c("json","list","data.frame"),
                       ... ){  
                
                #Create objet AgExpSite -------------------------------------------
                # obj_expsite <- AgExpSite$new(serverURL = self$serverURL ,
                #                              version = self$version)
                # print(obj_expsite)
                # #Get experiment sites studies -------------------------------
                # dt_expsite <- obj_expsite$ag_get_cropsite_expsiteId(expsiteDbId= expsiteDbId, format="data.frame", 
                #                                                     serverURL = self$serverURL, version = self$version)
                # sitecrop_id <- dt_expsite$siteCropId
                # print(sitecrop_id)
                # 
                super$endPoint <- "/crop-measurement/getAll?id="
                url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
                print(url)
                
                headerParams <- character()
                
                queryParams <- list(id = expsiteDbId) #everythig after the ? in the URL 
                
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
                
                
                #GET parameters for retrieving data ----------------------------
                #headerParams <- character()
                # queryParams <- vector(mode="list",length = 1)
                # 
                # #Allocate response objects from GET method ----------------------
                # res <- out <-  vector(mode="list", length = length(sitecrop_id))
                # 
                # #Iterate over exp_site_id to extract crop information by site from each site in the study
                # for(i in 1:length(sitecrop_id)){
                #   queryParams <- list(id = sitecrop_id[i])  
                #   res[[i]] <- self$call_api(
                #     url = url, 
                #     method = "GET",
                #     queryParams = queryParams, #, #TODO
                #     #headerParams = headerParams, #TODO
                #     #body = body,
                #     ...
                #   )    
                #   cont <- httr::content(res[[i]], as = "text", encoding = "UTF-8")
                #   #Object structure
                #   if(format=="json"){
                #     out[[i]] <-  cont
                #   } else if(format=="list"){
                #     out[[i]] <- jsonlite::fromJSON(cont,simplifyVector = "vector")
                #   } else if(format=="data.frame") {
                #     out[[i]] <- as_data_frame_agapi(cont)
                #   }
                # }
                # return(out)
                
              },
overwrite = TRUE)   





