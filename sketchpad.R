

# visualize data?

boxplot(followers$statuses)
outlier_cutoff <- summary(followers$statuses)[5]

spammers <- which(followers$statuses > outlier_cutoff)

followers$description[spammers]

targets

x <- intersect(targets, everyone$screenName)

everyone[screenName == "kalpenn", ]

c_vec <- as.character(everyone$screenName)

everyone <- cbind(everyone, c_vec)

everyone[c_vec == "kalpenn", ]

# convert int to character vector

typeof(everyone$c_vec)

everyone$screenName == everyone$c_vec

user <- getUser(targets[7])
user$description
browseURL(user$url)

temp_df <- data.frame(screenName=rep(NA, 400), desc=rep(NA, 400))

t2 <- targets[1:331]

for (i in 1:10) {
  try(user <- getUser(t2[i]))
  temp_df$screenName[i] <- user$screenName
  temp_df$desc[i] <- user$description
  try(browseURL(user$url))
}


t3 <- as.character(everyone$url[401:603])

for (i in 1:length(t3)) {
  try(browseURL(t3[i]))
}

which(t3 == "http://t.co/6mH5hVQass")

t4 <- as.character(everyone$url[280:300])

for (i in 1:length(t4)) {
  try(browseURL(t4[i]))
}

t4[4]

everyone[283, ]


# - - -

which(is.na(followers$url))
length(which(is.na(followers$url))) / dim(followers)[1]  # 20% of total w/o URL on @m_ezkiel
noURL_foll <- followers[which(is.na(followers$url)), ]

which(is.na(friends$url))
length(which(is.na(friends$url))) / dim(friends)[1]  # 8.44% of total w/o URL on @m_ezkiel
noURL_frien <- friends[which(is.na(friends$url)), ]

# - - -

