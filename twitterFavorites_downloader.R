# Twitter Favorites Downloader
# c. 2017-08-24

library(dplyr)
source("Functions/twitterConfig.R")
rm(list = ls())

# Define User
userName <- "m_ezkiel"

# Download Data (rate limited to 200)
user <- getUser(userName)
count <- user$favoritesCount; count
user$getFavorites(n=count) -> userFavorites
twListToDF(userFavorites) -> favs

# Reshape Data
names(favs)
attach(favs)
favoritesList <- data.frame(text=text,
                            favCount=favoriteCount,
                            rtCount=retweetCount,
                            author=screenName,
                            created=created)
detach(favs)

# Write Data
filename <- paste0("favsList_data/", userName, "_favoritesList.csv")
write.csv(favoritesList, file = filename)
