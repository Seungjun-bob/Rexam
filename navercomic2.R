library(rvest)

site <- "https://comic.naver.com/genre/bestChallenge?&page="
html_doc <- NULL
vnavercomic <- NULL

for(i in 1: 50) {
  url <- paste(site, i, sep="")
  print(url)
  html_doc <- read_html(url)

  
  comic.name <- html_text(html_nodes(html_doc,xpath = '//*[@id="content"]/div/table/tr/td/div/h6/a/text()'), trim = TRUE)

  comic.summary <- html_text(html_nodes(html_doc,xpath = '//*[@id="content"]/div/table/tr/td/div[2]/div[1]'))

  comic.grade <- html_text(html_nodes(html_doc,xpath = '//*[@id="content"]/div/table/tr/td/div[2]/div[2]/strong'))


  navercomic <- data.frame(comic.name, comic.summary, comic.grade)
  vnavercomic <- rbind(vnavercomic, navercomic)
}
View(vnavercomic)
write.csv(vnavercomic, "output/navercomic.csv")
