# 문제1
v <- sample(1:26,10)
v
sapply(v, function(x) LETTERS[x])

# 문제2
memo_new <- readLines("data/memo.txt",encoding="UTF-8")
memo_new <- gsub("[1-9]","",memo_new)
memo_new[1] <- gsub("[!@#$&^%*]","",memo_new[1])
memo_new[2] <- gsub("e","E",memo_new[2])
memo_new[4] <- gsub("R|Analysis|Big|Data","",memo_new[4])
memo_new[5] <- gsub("[!<>]","",memo_new[5])
memo_new[6] <- gsub(" ","",memo_new[6])
memo_new[7] <- gsub("YOU","you",memo_new[7])
memo_new[7] <- gsub("OK","ok",memo_new[7])
write(memo_new, file="memo_new.txt")

# 문제3
date <- '1996-01-05'
birth <- as.POSIXlt(date)
weekdays(birth)
       