library(tm)
library(stringi)
setwd("./git/Capstone-Swiftkey")


enUStwitter <- readLines("data/final/en_US/en_US.twitter.txt", encoding="UTF-8")
# con <- file("data/final/en_US/en_US.twitter.txt", open="rb")
# enUStwitter2 <- readLines(con, encoding="UTF-8")
# close(con)
saveRDS(enUStwitter, file="data/enUStwitter.RDS")

enUSblogs <- readLines("data/final/en_US/en_US.blogs.txt", encoding="UTF-8")
# con <- file("data/final/en_US/en_US.blogs.txt", open="rb")
# enUSblogs <- readLines(con, encoding="UTF-8")
# close(con)
saveRDS(enUSblogs, file="data/enUSblogs.RDS")

con <- file("data/final/en_US/en_US.news.txt", open="rb") # reading in binary
enUSnews <- readLines(con, encoding="UTF-8")
close(con)
saveRDS(enUSnews, file="data/enUSnews.RDS")

##########################################################

enUStwitter <- readRDS(file="data/enUStwitter.RDS")
enUSnews <- readRDS(file="data/enUSnews.RDS")
enUSblogs <- readRDS(file="data/enUSblogs.RDS")



# drop non UTF8 chars
enUStwitter <- iconv(enUStwitter, from = "latin1", to = "UTF-8", sub="")
enUStwitter <- stri_replace_all_regex(enUStwitter, "\u2019|`","'")
enUStwitter <- stri_replace_all_regex(enUStwitter, "\u201c|\u201d|u201f|``",'"')
