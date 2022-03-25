library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.megabox.co.kr/movie-detail/comment?rpstMovieNo=21049700")

df <- NULL

score <- remDr$findElements(using ="css selector", "#contentData > div > div.movie-idv-story > ul > li > div.story-area > div.story-box > div > div.story-cont > div.story-point > span")
score <- sapply(score,function(x){x$getElementText()})
vscore <- c(vscore,unlist(score))

category <- remDr$findElements(using ="css selector", "#contentData > div > div.movie-idv-story > ul > li > div.story-area > div.story-box > div > div.story-cont > div.story-recommend")
category <- sapply(category,function(x){x$getElementText()})
vcategory <- c(vcategory,unlist(category))

context <- remDr$findElements(using ="xpath", '//*[@id="contentData"]/div/div[4]/ul/li/div[1]/div[2]/div/div[2]/div[3]')
context <- sapply(context,function(x){x$getElementText()})
vcontext <- c(vcontext,unlist(context))

for (i in 2:10) {
  nextCss <- paste0("#contentData > div > div.movie-idv-story > nav > a:nth-child(",i,")", sep="")
  nextPage<-remDr$findElement(using='css selector', nextCss)
  nextPage$clickElement()
  Sys.sleep(1)
  
  score <- remDr$findElements(using ="css selector", "#contentData > div > div.movie-idv-story > ul > li > div.story-area > div.story-box > div > div.story-cont > div.story-point > span")
  score <- sapply(score,function(x){x$getElementText()})
  vscore <- c(vscore,unlist(score))
  
  category <- remDr$findElements(using ="css selector", "#contentData > div > div.movie-idv-story > ul > li > div.story-area > div.story-box > div > div.story-cont > div.story-recommend")
  category <- sapply(category,function(x){x$getElementText()})
  vcategory <- c(vcategory,unlist(category))
  
  context <- remDr$findElements(using ="xpath", '//*[@id="contentData"]/div/div[4]/ul/li/div[1]/div[2]/div/div[2]/div[3]')
  context <- sapply(context,function(x){x$getElementText()})
  vcontext <- c(vcontext,unlist(context))
  
}
df <- data.frame(vscore, vcategory, vcontext)
View(df)
write.csv(df, file='output/movie.csv')
