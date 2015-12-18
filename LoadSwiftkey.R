
setwd("./git/Capstone-Swiftkey")




con <- file("data/final/en_US/en_US.twitter.txt", open="rb")
enUStwitter <- readLines(con, encoding="UTF-8")
close(con)
saveRDS(enUStwitter, file="data/enUStwitter.RDS")


con <- file("data/final/en_US/en_US.news.txt", open="rb")
enUSnews <- readLines(con, encoding="UTF-8")
close(con)
saveRDS(enUSnews, file="data/enUSnews.RDS")

con <- file("data/final/en_US/en_US.blogs.txt", open="rb")
enUSblogs <- readLines(con, encoding="UTF-8")
close(con)
saveRDS(enUSblogs, file="data/enUSblogs.RDS")

