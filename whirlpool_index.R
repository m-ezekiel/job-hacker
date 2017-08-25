

friends <- read.csv("friendList_data/m_ezkiel_friendList.csv", header = TRUE)
followers <- read.csv("followerList_data/m_ezkiel_followerList.csv", header = TRUE)

everyone <- rbind(friends, followers)

desc_text <- gsub("[.,?/!:;\"()]", "", as.character(everyone$description))
desc_text <- gsub("'", " ", desc_text)

# Whirlpool ("@" symbol) Index 
grep("@", desc_text) -> wpIndex
wpIndex

# String processing to isolate "@____"
wp_descriptions <- desc_text[wpIndex]
unlist(strsplit(wp_descriptions, split = " ")) -> words
grep("@", words) -> wpTokens
gsub("@", "", words[wpTokens]) -> self_associations

sort(unique(self_associations))
