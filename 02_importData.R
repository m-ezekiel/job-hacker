# Job Hacker - 02_importData.R
# c. Tue Aug 29 15:18:14 CDT 2017

# Import source files
source("Functions/fxn_lib.R")

# Display account names for locally available data
listUsers()

# Define username
import_userName <- "m_ezkiel"

# Show files
list.files("data/", pattern = import_userName)

# Import data
friends <- read.csv(file = paste0("data/", import_userName, "_Friends.csv"))
followers <- read.csv(file = paste0("data/", import_userName, "_Followers.csv"))
favorites <- read.csv(file = paste0("data/", import_userName, "_Favorites.csv"))

