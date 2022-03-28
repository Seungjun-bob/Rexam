# 문제1
data <- read.csv("output/movie.csv")
df <- data['vcontext']
df <- gsub("[[:punct:]]", "", df)
df <- gsub("[A-z]", "", df) 
df <- gsub("[ㄱ-ㅎ]", "", df)
df <- gsub("[0-9]", "", df)
df <- gsub("[ㅏ-ㅣ]", "", df)

noun_df <- extractNoun(df)
df <- table(noun_df)

result <- sort(df, decreasing = T)
result <- head(final, 10)

df2<- data.frame(result)
names(df2) <- c("wname","wcount")
df2
View(df2)

write.csv(df2, file="output/movie_top_word.csv")

# 문제2
yes_data <- readLines("output/yes24.txt")
yes_data
yes_data <- gsub("[^가-힣]", " ", yes_data)
yes_noun <- extractNoun(yes_data)

yes_undata <- unlist(yes_noun)
yes_undata <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <= 4}, yes_undata)
yes_undata <- table(yes_undata)


yes_result <- sort(yes_undata, decreasing = T)
yes_df <- data.frame(yes_result)
View(yes_df)
result <- wordcloud2(yes_df,rotateRatio = 10000000)
htmltools::save_html(result,"output/yes24.html")
