

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

targets <- sort(unique(self_associations))
