# library(jsonlite)
# url <- "http://52.30.61.201/agrofims/api/v1/users.php"
# res <- httr::GET(url = url)
# out <- httr::content(x = res, as = "text", encoding = "UTF-8")
# # Get metadata
# x <- jsonlite::fromJSON(txt = out)