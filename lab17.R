# 문제1
library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
ggplot(mpg,aes(cty, hwy)) + geom_point(color="blue")

ggsave("output/result1.png") 

# 문제2
str(mpg)
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv), alpha=1.0)

ggsave("output/result2.png") 

# 문제3
click <- read.table('data/product_click.log')
names(click) <- c('시간','상품ID')

str(click)
ggplot(click, aes(x=상품ID)) + geom_bar(aes(fill=상품ID))

ggsave("output/result3.png") 

# 문제4
library(treemap)
data(GNI2014)
str(GNI2014)
treemap(GNI2014, vSize="population", index=c("continent", "iso3"), title="전세계 인구 정보", fontfamily.title="maple", fontfamily.labels="maple", border.col="green")

dev.copy(png, "output/result4.png")
dev.off()
