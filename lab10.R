library(rvest)
url <- "https://news.daum.net/"
url <- read_html(url)
newstitle <- html_text(html_nodes(url,'body > div.container-doc > main > section > div > div.content-article > div.box_g.box_news_issue > ul > li > div > div > span > span.txt_category'))
newstitle

newscategory <- html_text(html_nodes(url,xpath = '/html/body/div[2]/main/section/div/div[1]/div[1]/ul/li/div/div/strong/a/text()'), trim = TRUE)
newscategory                          

daumnews <- data.frame(newstitle, newscategory)

write.csv(daumnews, "output/daumnews.csv")
View(daumnews)
