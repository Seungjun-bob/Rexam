library(rvest)

url <- "https://comic.naver.com/genre/bestChallenge"
html_doc <- read_html(url)
html_doc

comic.name <- html_text(html_nodes(html_doc,xpath = '//*[@id="content"]/div/table/tr/td/div/h6/a/text()'), trim = TRUE)
comic.summary <- html_text(html_nodes(html_doc,xpath = '//*[@id="content"]/div/table/tr/td/div[2]/div[1]'))
comic.grade <- html_text(html_nodes(html_doc,xpath = '//*[@id="content"]/div/table/tr/td/div[2]/div[2]/strong'))


navercomic <- data.frame(comic.name, comic.summary, comic.grade)
View(navercomic)
