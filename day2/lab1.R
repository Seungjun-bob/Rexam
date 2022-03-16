# 문제1
v1 <- 1:10
v2 <- (1:10)*2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]


v1;v2;v3;max_v;min_v;avg_v;sum_v

# 문제2
v4 <- seq(1,10,2)
v5 <- rep(1,5)
v6 <- rep(1:3,3)
v7 <- rep(1:4,each=2)
v4;v5;v6;v7;

# 문제3
nums <- sample(1:100,10)
asc <- sort(nums)
dec <- sort(nums, decreasing = T)
up_num <- nums[nums>50]
down_num <- nums[nums<=50]
max_num <- which.max(nums)
min_num <- which.min(nums)

nums; asc;dec;over_num;down_num;max_num;min_num;

# 문제4
v8 <- seq(1,10,3)
names(v8) <- c("A","B","C","D")

v8;

# 문제5
score <- sample(1:20,5)
myFriend <- c("둘리","또치","도우너","희동","듀크")
ex_paste1 <- paste(score, myFriend, sep="-")
max_myFriend <- myFriend[which.max(score)]
min_myFriend <- myFriend[which.min(score)]
over_10 <- myFriend[score>10]
  
score;ex_paste1;max_myFriend;min_myFriend;over_10;

# 문제6
count <- sample(1:100,7)
week.korname <- c("일요일",
                  "월요일",
                  "화요일",
                  "수요일",
                  "목요일",
                  "금요일",
                  "토요일")
ex_paste2 <- paste(week.korname, count, sep = " : ")
max_week <- week.korname[which.max(count)]
min_week <- week.korname[which.min(count)]
over_50 <- week.korname[count>50]

count;week.korname;ex_paste2;max_week;min_week;over_50;

# 문제7
v1 <- sample(1:30, 10, replace = T)
v2 <- c("z", "y", "x", "w", "v", "u", "t", "s", "r", "q" )
names(v1) <- v2

v1;




