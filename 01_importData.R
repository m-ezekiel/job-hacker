# Job Hacker - 01_importData.R
# c. Tue Aug 29 13:52:01 CDT 2017

# Import libraries and source files
source("Functions/twitterConfig.R")
source("Functions/dL_friends.R")
source("Functions/dL_followers.R")
source("Functions/dL_favorites.R")

# Define user
userName <- "m_ezkiel"

# Download data
friendList <- dL_friends(userName)
followerList <- dL_followers(userName)
favoritesList <- dL_favorites(userName)  # rate limit = 200

# Write data
write.csv(friendList, file = paste0("data/", userName, "_Friends.csv"))
write.csv(followerList, file = paste0("data/", userName, "_Followers.csv"))
write.csv(favoritesList, file = paste0("data/", userName, "_Favorites.csv"))