library(httr)
library(rvest)
library(XML)
library(jsonlite)

# 문제1
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode("맛집")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- xmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text)
text <- gsub("&[A-Za-z]+t;", "", text)

write(text, file='output/naverblog.txt')

# 문제2
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
url
doc <- xmlParse(url, encoding="UTF-8")
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))

busRouteId <- df[df$busRouteNm == 360, "busRouteId"]
length <- df[df$busRouteNm == 360, "length"]
stStationNm <- df[df$busRouteNm == 360, "stStationNm"]
edStationNm <- df[df$busRouteNm == 360, "edStationNm"]
term <- df[df$busRouteNm == 360, "term"]

cat("[360번 버스정보]",'\n',
    "노선ID:",busRouteId,'\n',
    "노선길이:",length,'\n',
    "기점:",stStationNm,'\n',
    '종점:',edStationNm,'\n',
    '배차간격:',term,'\n',sep="")

# 문제3
searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode("빅데이터")
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/json",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

json.data <- content(doc, type='text', encoding = 'UTF-8')
json.obj <- fromJSON(json.data)
json.obj

json.df <- data.frame(json.obj)
json.newsdf <- json.df["items.title"]
json.newsdf <- gsub("</?b>","",json.newsdf)
json.newsdf <- gsub("&[a-z]+;","",json.newsdf)
write(json.newsdf,"output/navernews.txt")
