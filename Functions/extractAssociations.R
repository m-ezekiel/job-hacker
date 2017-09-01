# Job Hacker - extractAssociations.R
# c. Thu Aug 31 15:33:05 CDT 2017


# Input: Twitter data frame
# Output: Character vector of associations extracted from account description text
extractAssocations <- function(df) {
  
  # Clean text
  desc_text <- gsub("[.,?/!:;\"()]", "", as.character(df$description))
  desc_text <- gsub("'", " ", desc_text)
  
  # Whirlpool ("@" symbol) Index 
  grep("@", desc_text) -> wpIndex
  wpIndex
  
  # String processing to isolate "@____"
  wp_descriptions <- desc_text[wpIndex]
  unlist(strsplit(wp_descriptions, split = " ")) -> words
  grep("@", words) -> wpTokens
  gsub("@", "", words[wpTokens]) -> associations
  associations <- sort(unique(associations))
  
  return(targets)
}