# 문제1
data <- read.table('data/product_click.log')
names(data) <- c('시간','상품ID')

id_result <- as.factor(data$상품ID)
id_result <- summary(id_result)
barplot(id_result, main='세로바 그래프 실습', col.main='red',
        col=terrain.colors(10),                          
        las=1,
        ylab='클릭수',
        xlab='상품ID') 

dev.copy(png, "output/clicklog1.png")
dev.off()

# 문제2
data$시간 <- substr(data$시간, 9,10)
data

time_result <- as.factor(data$시간)
time_result <- summary(time_result)
names(time_result) <- c('0~1','1~2','2~3','3~4','4~5','5~6','8~9','9~10','10~11',
                      '11~12','12~13','13~14','14~15','15~16','16~17','17~18','18~19')
pie(time_result, main='파이그래프 실습', col.main='blue',
    labels=paste(names(time_result)), col=rainbow(10))

dev.copy(png, "output/clicklog2.png")
dev.off()

# 문제3
data2 <- read.table('data/성적.txt', header=TRUE)
score <- as.factor(data2$성명)
score <- summary(score)
score
data2
xname <- data2$성명
성적 <- data2[3:5]
barplot(t(성적), main="학생별 점수",
        ylab="점수", col=rainbow(10),
        names.arg=xname)

dev.copy(png, "output/clicklog3.png")
dev.off()

