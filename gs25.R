library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost" , 
                      port = 4445, browserName = "chrome")
remDr$open()

site <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(site)

two_to_one_page <- remDr$findElement(using='css selector', '#TWO_TO_ONE')
two_to_one_page$clickElement()

eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
eventgoodsname <- sapply(eventgoodsnodes, function(x) {x$getElementText()})

eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
eventgoodsprice <- sapply(eventgoodsnodes, function(x) {x$getElementText()})

goodsname <- c(unlist(eventgoodsname))
goodsprice <- c(unlist(eventgoodsprice))

repeat {
  for (i in 2:10) {               
    nextCss <- paste("#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > span > a:nth-child(",i,")", sep="")                
    try(nextListLink<-remDr$findElement(using='css selector',nextCss))
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement()
    Sys.sleep(1)
    
    eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
    eventgoodsname <- sapply(eventgoodsnodes, function(x) {x$getElementText()})
    
    eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
    eventgoodsprice <- sapply(eventgoodsnodes, function(x) {x$getElementText()})
    
    goodsname <- c(goodsname, unlist(eventgoodsname))
    goodsprice <- c(goodsprice, unlist(eventgoodsprice))
  }
  
  try(nextPage<-remDr$findElement(using='css selector',
                                  "#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next"))
  if(length(nextPage) == 0)  break;
  nextPage$clickElement()
  Sys.sleep(1)
  
  eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  eventgoodsname <- sapply(eventgoodsnodes, function(x) {x$getElementText()})
  
  eventgoodsnodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  eventgoodsprice <- sapply(eventgoodsnodes, function(x) {x$getElementText()})
  
  goodsname <- c(goodsname, unlist(eventgoodsname))
  goodsprice <- c(goodsprice, unlist(eventgoodsprice))        
}

goodsprice <- gsub(',','',goodsprice)
goodsprice <- gsub('원','',goodsprice)

df <- data.frame(goodsname, goodsprice)
View(df)
write.csv(df, file='output/gs25_twotoone.csv')
