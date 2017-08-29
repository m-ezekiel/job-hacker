# Job Hacker - Functions/dL_favorites.R
# c. Tue Aug 29 14:34:09 CDT 2017

# DESCRIPTION: Input a twitter username string vector to download likes/favorites data.
# Returns a custom formatted dataframe with profile information on given user's favorited tweets.

dL_favorites <- function(userName) {
  
  # Download and transform data (Note: user$getFavorites is rate limited to 200)
  user <- getUser(userName)
  count <- user$favoritesCount
  userFavorites_df <- twListToDF(user$getFavorites(n=count))
  
  # Reshape Data
  attach(userFavorites_df)
  favoritesList <- data.frame(text=text,
                              favCount=favoriteCount,
                              rtCount=retweetCount,
                              author=screenName,
                              created=created)
  detach(userFavorites_df)
  
  return(favoritesList)
  
}
