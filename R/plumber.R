# Packages ----
library(plumber)

# Utils ----
source("utils.R")

#* @apiTitle Example API

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
echo

#* Simple plot
#* @png
#* @get /simple-plot
function() {
  hist(rnorm(1000))
}

#* Plot input data
#* @png 
#* @param facet Facet variable
#* @post /plot
function(req, res, facet = NULL) {
  # Parse data from req body
  data <- tryCatch(jsonlite::parse_json(req$postBody, simplifyVector = TRUE),
                       error = function(e) NULL)
  if (is.null(data)) {
    res$status <- 400
    return(list(error = "Invalid data submitted"))
  }
  
  print(diamonds_plot(data, facet))
}

#* Sum two values
#* @param x Value 1
#* @param y Value 2
#* @get /sum
function(x, y) {
  as.numeric(x) + as.numeric(y)
}