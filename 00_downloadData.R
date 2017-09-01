# Job Hacker - 00_downloadData.R
# c. Tue Aug 29 13:52:01 CDT 2017

# Import libraries and source files
source("Functions/twitterConfig.R")
source("Functions/dL_friends.R")
source("Functions/dL_followers.R")
source("Functions/dL_favorites.R")

# Define user
dL_userName <- "m_ezkiel"


# Download and write data
favoritesList <- dL_favorites(dL_userName)  # rate limit = 200
write.csv(favoritesList, file = paste0("data/", dL_userName, "_Favorites.csv"), row.names = FALSE)

friendList <- dL_friends(dL_userName)
write.csv(friendList, file = paste0("data/", dL_userName, "_Friends.csv"), row.names = FALSE)

followerList <- dL_followers(dL_userName)
write.csv(followerList, file = paste0("data/", dL_userName, "_Followers.csv"), row.names = FALSE)


# Clean-up
rm(dL_userName, favoritesList, followerList, friendList)
