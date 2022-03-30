library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

data <- read.table('data/product_click.log')
names(data) <- c('시간','상품ID')

data$시간 <- substr(data$시간, 1,8)
data$시간

data$시간 <- as.Date(data$시간,format='%Y%m%d') 
data$시간

day <- as.POSIXlt(data$시간)
weekdays(day)
data$요일 <- weekdays(day)

result <- table(data$요일)

result <- c(result[4],result[6],result[3],result[2],result[1],result[5])

result
par(mfrow = c(1,2),mar=c(2,2,2,1))
plot(result,
     main='요일별 클릭 수', 
     type='o',
     col="orange",
     lty=1,
     lwd=3,
     axes=FALSE,
     ann=FALSE,
     ylim=c(0,300),
     family="maple"
)
axis(1, at=1:6, lab=c("월요일","화요일","수요일","목요일", "금요일","토요일"))
axis(2, at=c(0,50,100,150,200,250,300), family="maple")

barplot(result,
        main='요일별 클릭 수',
        ylim=c(0,300),
        col= rainbow(6),
        family="maple")

dev.copy(png, "output/clicklog4.png", height=800, width=1200)
dev.off()

# 문제2
data2 <- read.csv("data/movie_reviews3.csv")
point <- data2[,3]
point
par(mfrow = c(1,3),mar=c(5,5,5,5))
hist(point,                 
     main='영화 평점 히스토그램(auto)',
     xlab ='평점',              
     ylab='평가지수',
     ylim=c(0,500),
     col=rainbow(10),             
     las=1,
     ) 

hist(point,                 
     main='영화 평점 히스토그램(1~5,6~10)',
     xlab ='평점',              
     ylab='평가지수',
     ylim=c(0,800),
     col=rainbow(10),             
     las=1,
     breaks=2)

hist(point,                 
     main='영화 평점 히스토그램(1~5,6,7,8,9,10)',
     xlab ='평점',              
     ylab='평가지수',
     ylim=c(0,800),
     col=rainbow(10),             
     las=1,
     breaks=c(1,5,6,7,8,9,10),
     freq=T) 

dev.copy(png, "output/clicklog5.png", height=800, width=1200)
dev.off()

# 문제3
data3 <- read.csv('data/one.csv')
str(data3)
data3$구별
data3$X1인가구

boxplot(data3$X1인가구~data3$구별,            
        data=data3,                       
        main='구별 1인가구',
        las=2,
        xlab='',
        ylab='',
        col=c('green','yellow','blue'))

dev.copy(png, "output/clicklog6.png", height=800, width=1200)
dev.off()
