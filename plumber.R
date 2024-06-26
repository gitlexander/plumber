library(plumber)

# Define your R function as an endpoint
#* @param a The first number
#* @param b The second number
#* @get /add
function(a, b) {
  result <- as.numeric(a) + as.numeric(b)
  list(result)
}
