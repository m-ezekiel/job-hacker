# Job Hacker - 01_importData.R
# c. Tue Aug 29 15:18:14 CDT 2017

# Import source files
source("Functions/fxn_lib.R")

# Display account names for locally available data
listUsers()

# Define username
userName <- "m_ezkiel"

# Show files
list.files("data/", pattern = userName)

# Import data
friends <- read.csv(file = paste0("data/", userName, "_Friends.csv"), stringsAsFactors = TRUE)
followers <- read.csv(file = paste0("data/", userName, "_Followers.csv"), stringsAsFactors = TRUE)
favorites <- read.csv(file = paste0("data/", userName, "_Favorites.csv"), stringsAsFactors = TRUE)

# Clean-up
rm(userName, favorites, followers, friends)
