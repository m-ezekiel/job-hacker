# Job Hacker - Functions/dL_followers.R
# c. Tue Aug 29 13:52:01 CDT 2017


# DESCRIPTION: Input a twitter username string vector to download follower data.
# Returns a custom formatted dataframe with profile information on given user's followers.

dL_followers <- function(userName) {
  
  # Download and transform data
  user <- getUser(userName)
  count <- user$followersCount
  userFollowers_df <- twListToDF(user$getFollowers(n=count))
  
  # Reshape Data
  attach(userFollowers_df)
  followerList <- data.frame(name=name, 
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
  detach(userFollowers_df)
  
  return(followerList)
  
}
