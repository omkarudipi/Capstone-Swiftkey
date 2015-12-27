library(magrittr)
library(RUnit)

samplefile <- function(filename, fraction) {
    system(paste("perl -ne 'print if (rand() < ",
                 fraction, ")'", filename), intern=TRUE)
}

tokenize <- function(v) {
    # Add spaces before and after punctuation,
    # remove repeat spaces, and split the strings
    gsub("([^ ])([.?!&])", "\\1 \\2 ", v)   %>%
        gsub(pattern=" +", replacement=" ")     %>%
        strsplit(split=" ")
}

profanity_filter <- function(tv) {
    # Takes a tokenized vector
#     bad_words <- paste("([Ff][Uu][Cc][Kk]",
#                        "[Dd][Aa][Mm][Nn]",
#                        "[Ss$][Hh][Ii][Tt]",
#                        "[Aa@][Ss$][Ss$]",
#                        "[Aa@][Ss$][Ss$][Hh][Oo][Ll][Ee]",
#                        "[Cc][Uu][Nn][Tt]",
#                        "[Nn][Ii][Gg][Gg][Ee][Rr])", sep="|")
   
    bad_words2 <- read.csv("data/swearWords.csv", header = FALSE, sep =",", quote = "")
    
    lapply(tv, function(x) gsub(bad_words2, " ", tolower(x)) %>%
        lapply(FUN=function(x) x[!x == " "])
}





http://www.bannedwordlist.com/lists/swearWords.csv

test.tokenize <- function() {
    to_token <- c("This is a test.",
                  "test&2 now  ",
                  "more punct?uation",
                  "This! is nice",
                  "So ! is this.")
    
    expected <- list(c("This", "is", "a", "test", "."),
                     c("test", "&", "2", "now"),
                     c("more", "punct", "?", "uation"),
                     c("This", "!", "is", "nice"),
                     c("So", "!", "is", "this", "."))
    results <- tokenize(to_token)
    
    checkEquals(results, expected)
}

test.profanity_filter <- function() {
    to_test <- c("Fuck you!", "FUCK this SHIT", "ah $hiT", "Damn you asshole",
                 "Fine.", "cunt nigger sunshine shit")
    
    expected <- list(c("you", "!"), c("this"), c("ah"), c("you"),
                     c("Fine", "."), c("sunshine"))
    results <- profanity_filter(tokenize(to_test))
    
    checkEquals(results, expected)
}