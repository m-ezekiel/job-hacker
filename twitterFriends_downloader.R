# Twitter Friends Downloader
# c. 2017-08-24

source("Functions/twitterConfig.R")
rm(list = ls())

# Define User
userName <- "m_ezkiel"

# Download Data
user <- getUser(userName)
count <- user$friendsCount; count
user$getFriends(n=count) -> userFriends
twListToDF(userFriends) -> ufl

# Reshape Data
attach(ufl)
friendList <- data.frame(name=name, 
                         screenName=screenName,
                         description=description,
                         statuses=statusesCount,
                         favorites=favoritesCount,
                         friends=friendsCount,
                         followers=followersCount,
                         listed=listedCount,
                         created=created,
                         protected=protected,
                         verified=verified,
                         language=lang,
                         location=location,
                         profileImage=profileImageUrl,
                         url=url)
detach(ufl)


# Write Data
filename <- paste0("friendList_data/", userName, "_friendList.csv")
write.csv(friendList, file = filename)
