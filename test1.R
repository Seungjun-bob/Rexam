# 문제6
test1<- scan("data/iotest1.txt",encoding = 'UTF-8')
cat('오름차순:',order(test1),'\n',
    '내림차순:',order(test1,decreasing = TRUE),'\n',
    '합:',sum(test1),'\n',
    '평균:',mean(test1))
