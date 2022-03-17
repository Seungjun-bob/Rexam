# 문제1
str(iris)

# 문제2
df1 <- data.frame(
  x=c(1:5), 
  y=c(seq(2,10,2)))

df1;

# 문제3
col1 <- c(1:5)
col2 <- c(letters[1:5])
col3 <- c(6:10)
df2 <- data.frame(col1,col2,col3)

df2;

# 문제4
제품명 <- c('사과','딸기','수박')
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)
df3 <- data.frame(가격,판매량)
rownames(df3) <- 제품명
df3;

# 문제5
mean(df3$가격)
mean(df3$판매량)

# 문제6
name <- c("Potter","Elsa","Gates","Wendy","Ben")
gender <- factor(c("M","F","M","F","M"))
math <- c(85,76,99,88,40)
df4 <- data.frame(name,gender,math)
df4;

# 문제6-(a)
stat <- c(76,73,95,82,35)
df4$stat <- stat
df4;

# 문제6-(b)
df4$score <- df4$math + df4$stat
df4;

# 문제6-(c)
df4$grade<-ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100,"B", 
                           ifelse(df4$score >=70,"C","D")))
df4;

# 문제7
myemp <- read.csv("data/emp.csv")
str(myemp)

# 문제8
myemp[3:5,]

# 문제9
myemp[,-4]

# 문제10
myemp["ename"]

# 문제11
myemp[c("ename","sal")]

# 문제12
subset(myemp,
       select=c("ename","sal","job"),
       subset=myemp$job=="SALESMAN")

# 문제13
subset(myemp,
       select=c("ename","sal","deptno"),
       subset=sal>=1000 & sal<=3000)

# 문제14
subset(myemp,
       select=c("ename","job","sal"),
       subset=job!="ANALYST")

# 문제15
subset(myemp,
       select=c("ename","job"),
       subset=job=="SALESMAN" | job=="ANALYST")

# 문제16
subset(myemp,
       select=c("ename","sal"),
       subset=is.na(comm))

# 문제17
myemp;
myemp[c(order(myemp$sal)),]
my

 # 문제18
nrow(myemp)
ncol(myemp)

# 문제19
subset(aggregate(empno~deptno, myemp, length))
summary(factor(myemp$deptno))
table(myemp$deptno)

# 문제20
subset(aggregate(empno~job, myemp, length))
myemp$job <- as.factor(myemp$job)
summary(myemp$job)



