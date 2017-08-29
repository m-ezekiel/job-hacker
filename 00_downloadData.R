# Job Hacker - 00_downloadData.R
# c. Tue Aug 29 13:52:01 CDT 2017

# Import libraries and source files
source("Functions/twitterConfig.R")
source("Functions/dL_friends.R")
source("Functions/dL_followers.R")
source("Functions/dL_favorites.R")

# Define user
dL_userName <- "m_ezkiel"

# Download data
friendList <- dL_friends(dL_userName)
followerList <- dL_followers(dL_userName)
favoritesList <- dL_favorites(dL_userName)  # rate limit = 200

# Write data
write.csv(friendList, file = paste0("data/", dL_userName, "_Friends.csv"))
write.csv(followerList, file = paste0("data/", dL_userName, "_Followers.csv"))
write.csv(favoritesList, file = paste0("data/", dL_userName, "_Favorites.csv"))

# Clean-up
rm(dL_userName, favoritesList, followerList, friendList)
