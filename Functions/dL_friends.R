# Job Hacker - Functions/dL_friends.R
# c. Tue Aug 29 13:52:01 CDT 2017


# DESCRIPTION: Input a twitter username string vector to download friend data.
# Returns a custom formatted dataframe with profile information on given user's friends.

dL_friends <- function(userName) {

  # Download and transform data
  user <- getUser(userName)
  count <- user$friendsCount
  userFriends_df <- twListToDF(user$getFriends(n=count))
  
  # Reshape Data
  attach(userFriends_df)
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
  detach(userFriends_df)
  
  return(friendList)

}
