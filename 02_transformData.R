# Job Hacker - 02_transformData.R
# c. Wed Aug 30 15:30:37 CDT 2017

source("Functions/extractAssociations.R")

# Extract whirlpools ("@" symbol) from friends + followers.
combined <- rbind(friends, followers)
self_associations <- extractAssocations(combined)

n <- length(self_associations)
empty <- rep(NA, 50)

temp_df <- data.frame(name=empty, 
                      screenName=empty,
                      description=empty,
                      # statuses=empty,
                      # favorites=empty,
                      # friends=empty,
                      # followers=empty,
                      # listed=empty,
                      # created=empty,
                      # protected=empty,
                      # verified=empty,
                      # language=empty,
                      # location=empty,
                      # profileImage=empty,
                      url=empty)


for (i in 10:50) {
  try(user <- getUser(self_associations[i]))
  
  # if it's true continue, if not then don't
  temp_df$name[i] <- user$name
  temp_df$screenName[i] <- user$screenName
  temp_df$description[i] <- user$description
  # temp_df$statuses <- user$statuses
  # temp_df$favorites
  # temp_df$friends
  # temp_df$followers
  # temp_df$listed
  # temp_df$created
  # temp_df$protected
  # temp_df$verified
  # temp_df$language
  # temp_df$location
  # temp_df$profileImage
  try(temp_df$url[i] <- user$url)
}


