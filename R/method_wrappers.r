#' Wrapper for experimental details get method 
#' 
#' @description wrapper function for \code{objetc$ag_get_expdetails_studyId} from \code{AgExpDetails} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgExpDetails
#' @param studyDbId character agronomic study identifier from AGROFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' @examples \dontrun{
#' #Get experimental details by studyId (agronomic study ID)
#' out <- ag_get_expdetails_studyId(studyDbId = 21, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0212/r")
#' }
#' @export
#' 

ag_get_expdetails_studyId <- function(studyDbId =NULL,
                          format=c("json","list","data.frame"),
                          serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                          version ="/0212/r",
                          ...){

  format <- match.arg(format)
  sc <- AgExpDetails$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_expdetails_studyId(studyDbId = studyDbId,
             format = format,
             ...
             )
  
  return(out)
    
}

#' Wrapper for funding agency get method
#' 
#' @description wrapper function for \code{objetc$ag_get_fundagency_studyId} method from \code{AgFundAgency} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgFundAgency
#' @param studyDbId character agronomic study identifier from AGROFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' #Get funding agencies information by studyId (agronomic study ID)
#' out <- ag_get_fundagency_studyId(studyDbId = 11,
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#'                                  version ="/0253/r")
#' }
#' @export
#' 

ag_get_fundagency_studyId <- function(studyDbId =NULL,
                                      format=c("json","list","data.frame"),
                                      serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0253/r",
                                      ...){
  
  format <- match.arg(format)
  sc <- AgFundingAgency$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_fundagency_studyId(studyDbId = studyDbId,
                                      format = format,
                                      ...
                                      )
  return(out)
}


#' Wrapper for project entity get method
#' 
#' @description wrapper function for \code{objetc$ag_get_projentity_studyId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgProjEntity
#' @param studyDbId character agronomic study identifier from AGROFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' #Get project management entity information by studyId (agronomic study ID)
#' out <- ag_get_projentity_studyId(studyDbId = 6, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0212/r")
#' }
#' @export
#' 

ag_get_projentity_studyId <- function(studyDbId =NULL,
                                      format=c("json","list","data.frame"),
                                      serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0233/r",
                                      ...){
  
  format <- match.arg(format)
  sc <- AgProjEntity$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_projentity_studyId(studyDbId = studyDbId,
                                      format = format,
                                      ...
  )
  return(out)
}




#' Wrapper for project lead get method
#' 
#' @description wrapper function for \code{objetc$ag_get_projlead_studyId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgProjLead
#' @param studyDbId character agronomic study identifier from AGROFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' #Get project management lead information by studyId (agronomic study ID)
#' out <- ag_get_projlead_studyId(studyDbId = 21, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0212/r")
#' }
#' @export
#' 

ag_get_projlead_studyId <- function(studyDbId =NULL,
                                      format=c("json","list","data.frame"),
                                      serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0212/r",
                                      ...){
  
  format <- match.arg(format)
  sc <- AgProjLead$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_projlead_studyId(studyDbId = studyDbId,
                                    format = format,
                                    ...)
  return(out)
}




#' Wrapper for personnel get method
#' 
#' @description wrapper function for \code{objetc$ag_get_personnel_studyId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgPersonnel
#' @param studyDbId character agronomic study identifier from AGROFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' #Get personnel information by studyId (agronomic study ID)
#' out <- ag_get_personnel_studyId(studyDbId = 6, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0212/r")
#' }
#' @export
#' 

ag_get_personnel_studyId <- function(studyDbId =NULL,
                                    format=c("json","list","data.frame"),
                                    serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                    version ="/0233/r",
                                    ...){
  
  format <- match.arg(format)
  sc <- AgPersonnel$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_personnel_studyId(studyDbId = studyDbId,
                                    format = format,
                                    ...)
  return(out)
}




#' Wrapper for experiment-site (field book) GET method
#' 
#' @description wrapper function for \code{objetc$ag_get_expsite_studyId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgSite
#' @param studyDbId character agronomic study identifier from AGROFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' #Get experiment site information
#'  by studyId (agronomic study ID)
#' out <- ag_get_expsite_studyId(studyDbId = 6, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0233/r")
#' }
#' @export
#' 
ag_get_expsite_studyId <- function(studyDbId =NULL,
                                    format=c("json","list","data.frame"),
                                    serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                    version ="/0233/r",
                                    ...){

  format <- match.arg(format)
  sc <- AgExpSite$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_expsite_studyId(studyDbId = studyDbId,
                                     format = format,
                                     ...)
    
}

#' Wrapper for site description (field book) GET method
#' 
#' @description wrapper function for \code{objetc$ag_get_sitedesc_expsiteId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgSite
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' #Get site description information by expsiteDbId (experiment site ID)
#' out <- ag_get_sitedesc_expsiteId(expsiteDbId = 6, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0233/r")
#' }
#' @export
#' 

ag_get_sitedesc_expsiteId <-  function(expsiteDbId=NULL, 
                                       format=c("json","list","data.frame"),
                                       serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                       version ="/0233/r",
                                       ...){
  
  format <- match.arg(format)
  sc <- AgExpSite$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_sitedesc_expsiteId(expsiteDbId = expsiteDbId,
                                      format = format,
                                      ...)
    
}


#' Wrapper for crop-site information GET method
#' 
#' @description wrapper function for \code{objetc$ag_get_cropsite_expsiteId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgSite
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' #Get crop-site description information by expsiteDbId (experiment site ID)
#' out <- ag_get_cropsite_expsiteId(expsiteDbId = 9, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0233/r")
#' }
#' @export
#' 

ag_get_cropsite_expsiteId <-  function(expsiteDbId=NULL, 
                                       format=c("json","list","data.frame"),
                                       serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                       version ="/0233/r",
                                       ...){
  
  format <- match.arg(format)
  sc <- AgExpSite$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_cropsite_expsiteId(expsiteDbId = expsiteDbId,
                                     format = format)
}

###
#' Wrapper for ag_get_edsinfo_expsiteId method
#' 
#' @description wrapper function for \code{ag_get_edsinfo_expsiteId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgExpDesign
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get experimental design factors by expsiteDbId (experiment site ID)
#' out <- ag_get_edsinfo_expsiteId(expsiteDbId = 9, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0233/r")
#' }
#' @export
#' 
ag_get_edsinfo_expsiteId <- function(expsiteDbId=NULL, 
                                      format=c("json","list","data.frame"),
                                      serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0233/r",
                                      ...){
  
  format <- match.arg(format)
  sc <- AgExpDesign$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_edsinfo_expsiteId(expsiteDbId = expsiteDbId,
                                        format = format)
  
}

#' Wrapper for ag_get_edsfactors_expsiteId method
#' 
#' @description wrapper function for \code{objetc$ag_get_edsfactors_expsiteId} method from \code{AgProjEntity} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgExpDesign
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get experimental design factors by expsiteDbId (experiment site ID)
#' out <- ag_get_edsfactors_expsiteId(expsiteDbId = 9, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0233/r")
#' }
#' @export
#' 

ag_get_edsfactors_expsiteId <-  function(expsiteDbId=NULL, 
                                         format=c("json","list","data.frame"),
                                         serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                         version ="/0233/r",
                                         ...){
  
  format <- match.arg(format)
  sc <- AgExpDesign$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_edsfactors_expsiteId(expsiteDbId = expsiteDbId, 
                                        format = format)
  
}


# Crop measurement
#' Wrapper for ag_get_cropmea_expsiteId method from AgCropMea class
#' 
#' @description wrapper function for \code{objetc$ag_get_cropmea_expsiteId } method from \code{AgCropMea} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgCropMea
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get crop measurements variables by expsiteDbId (experiment site ID)
#' library(ragapi)
#' out <- ag_get_cropmea_expsiteId(expsiteDbId = 6,
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#'                                  version ="/0248/r")
#' }
#' @export
#
ag_get_cropmea_expsiteId <- function(expsiteDbId =NULL,
                                     format=c("json","list","data.frame"),
                                     serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                     version ="/0233/r",
                                      ...){
      
  #sc: instance class (objet)
  sc <- AgCropMea$new(serverURL = serverURL,
                       version = version)
  out <- sc$ag_get_cropmea_expsiteId(expsiteDbId = expsiteDbId, format=format,...)
  
}
### Management practices 

# Man Prac
#' Wrapper for ag_get_manprac_expsiteId  method
#' 
#' @description wrapper function for \code{objetc$ag_get_manprac_expsiteId} method from \code{AgWeatherMea} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgWeatherMea
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0253}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get management practices variables by expsiteDbId (experiment site ID)
#' out <- ag_get_manprac_expsiteId(expsiteDbId = 8,
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#'                                  version ="/0253/r")
#' }
#' @export
#
ag_get_manprac_expsiteId <- function(expsiteDbId=NULL,
                                     format=c("json","list","data.frame"),
                                     serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                     version ="/0253/r",
                                     ...){
  
  #sc: instance class (objet)
  sc <- AgManPrac$new(serverURL = serverURL,
                         version = version )
  out <- sc$ag_get_manprac_expsiteId(expsiteDbId = expsiteDbId, format=format)
  
}


# Fertilizer measurements ###

#' Wrapper for ag_get_fertmea_siteId  method
#' 
#' @description wrapper function for \code{objetc$ag_get_fertmea_expsiteId} method from \code{AgFertilizerMea} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgFertilizerMea
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0253}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get fertilizer measurements, nutrients and products,  by expsiteDbId (experiment site ID)
#' out <- ag_get_fertmea_expsiteId(expsiteDbId = 7,
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#'                                  version ="/0291/r")
#' }
#' @export
#
ag_get_fertmea_expsiteId <- function(expsiteDbId=NULL,
                                     format=c("json","list","data.frame"),
                                     serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                     version ="/0291/r",
                                     ...){
  
  #sc: instance class (objet)
  sc <- AgFertilizerMea$new(serverURL = serverURL,
                            version = version
                            )
  out <- sc$ag_get_fertmea_expsiteId(expsiteDbId = expsiteDbId, format=format)
  
}






###########

# Phenology
#' Wrapper for ag_get_phenomea_expsiteId method from AgPhenoMea class
#' 
#' @description wrapper function for \code{objetc$ag_get_phenomea_expsiteId } method from \code{AgPhenoMea} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgPhenoMea
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get crop measurements variables by expsiteDbId (experiment site ID)
#' library(ragapi)
#' out <- ag_get_phenomea_expsiteId(expsiteId = 6,
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#'                                  version ="/0248/r")
#' }
#' @export
#
ag_get_phenomea_expsiteId <- function(expsiteDbId =NULL,
                                     format=c("json","list","data.frame"),
                                     serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                     version ="/0248/r",
                                     ...){
  
  #sc: instance class (objet)
  sc <- AgPhenoMea$new(serverURL = serverURL,
                      version = version)
  out <- sc$ag_get_phenomea_expsiteId(expsiteDbId = expsiteDbId, format=format,...)
  
}


###########

# Soil ###############################################333
#' Wrapper for ag_get_soil_expsiteId  method
#' 
#' @description wrapper function for \code{objetc$ag_get_soil_expsiteId } method from \code{AgSoilMea} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgSoilMea
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get soil variables by expsiteDbId (experiment site ID)
#' library(ragapi)
#' out <- ag_get_soil_expsiteId(expsiteDbId = 6, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0233/r")
#' }
#' @export
#
ag_get_soil_expsiteId <- function(expsiteDbId =NULL,
                                     format=c("json","list","data.frame"),
                                     serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                     version ="/0233/r",
                                     ...){
  
  #sc: instance class (objet)
  sc <- AgSoilMea$new(serverURL = serverURL,
                         version = version )
  out <- sc$ag_get_soil_expsiteId(expsiteDbId = expsiteDbId, format=format)
  
}


# Weather
#' Wrapper for ag_get_weather_expsiteId  method
#' 
#' @description wrapper function for \code{objetc$ag_get_weather_expsiteId } method from \code{AgWeatherMea} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgWeatherMea
#' @param expsiteDbId character experiment site ID from AgroFIMS database
#' @param format data format: json, list and data.frame
#' @param serverURL URL of the agrofims server
#' @param version version of the call. By default version \code{0212}.
#' @param ... additional parameters 
#' @author Omar Benites
#' 
#' @examples \dontrun{
#' Get weather variables by expsiteDbId (experiment site ID)
#' out <- ag_get_weather_expsiteId(expsiteDbId = 6, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0233/r")
#' }
#' @export
#
ag_get_weather_expsiteId <- function(expsiteDbId =NULL,
                         format=c("json","list","data.frame"),
                         serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                         version ="/0233/r",
                         ...){
                           
  #sc: instance class (objet)
  sc <- AgWeatherMea$new(serverURL = serverURL,
                         version = version )
  out <- sc$ag_get_weather_expsiteId(expsiteDbId = expsiteDbId, format=format)

}






