# Twitter Followers Downloader
# c. 2017-08-24

library(dplyr)
source("twitterConfig.R")
rm(list = ls())

# Define User
userName <- "m_ezkiel"

# Download Data
user <- getUser(userName)
count <- user$followersCount; count
user$getFollowers(n=count) -> userFollowers
twListToDF(userFollowers) -> uwl

# Reshape Data
names(uwl)
attach(uwl)
followerList <- data.frame(name=name, 
                         screenName=screenName,
                         description=description,
                         statuses=statusesCount,
                         favorites=favoritesCount,
                         followers=followersCount,
                         listed=listedCount,
                         created=created,
                         protected=protected,
                         verified=verified,
                         language=lang,
                         location=location,
                         profileImage=profileImageUrl,
                         url=url)
detach(uwl)


# Write Data
filename <- paste0("followerList_data/", userName, "_followerList.csv")
write.csv(followerList, file = filename)
