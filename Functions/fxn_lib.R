# Job Hacker - Functions/fxn_lib.R
# Support project readability with helper functions.
# c. Tue Aug 29 15:18:14 CDT 2017

# Display account names for locally available Twitter data
listUsers <- function() {
  files <- list.files("data/")
  files <- gsub("_Favorites.csv", "", files)
  files <- gsub("_Followers.csv", "", files)
  files <- gsub("_Friends.csv", "", files)
  unique(files)
}