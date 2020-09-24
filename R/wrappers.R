#' Wrapper for experimental details get method 
#' 
#' @description wrapper function for \code{objetc$ag_get_expdetails_studyId} from \code{AgExpDetails} objects. 
#' @param ... inherents arguments from AgAPIClient class and AgExpDetail
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
#' out <- ag_get_fundagency_studyId(studyDbId = 6, 
#'                                  format = "data.frame",
#'                                  serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", 
#'                                  version ="/0212/r")
#' }
#' @export
#' 

ag_get_fundagency_studyId <- function(studyDbId =NULL,
                                      format=c("json","list","data.frame"),
                                      serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0212/r",
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
                                      version ="/0212/r",
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
#' @param ... inherents arguments from AgAPIClient class and AgProjEntity
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
#' @param ... inherents arguments from AgAPIClient class and AgProjEntity
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
                                    version ="/0212/r",
                                    ...){
  
  format <- match.arg(format)
  sc <- AgPersonnel$new(serverURL = serverURL, version = version)
  out <- sc$ag_get_personnel_studyId(studyDbId = studyDbId,
                                    format = format,
                                    ...)
  return(out)
}





