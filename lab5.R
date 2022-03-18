# 문제1
grade <- sample(1:6,1)
grade
if (grade==1 | grade==2 | grade==3){
  cat(grade, '학년은 저학년입니다.')
}else{
  cat(grade, '학년은 고학년입니다.')
}

# 문제2
choice <- sample(1:5,1)
choice
if (choice==1){
  result <- 300+50
}else if(choice==2){
  result <- 300-50
}else if(choice==3){
  result <- 300*50
}else if(choice==4){
  result <- 300/50
}else{
  result <- 300%%50
}
cat('결과값:',result)

# 문제3
count <- sample(3:10,1);count
deco <- sample(1:3,1);deco
if (deco==1){
  result <- '*'
}else if (deco==2){
  result <- '$'
}else if (deco==3){
  result <- '#'
}
for (i in 1:count){
  cat(result)
}

# 문제4
score <- sample(0:100,1);score;
score_ten <- paste(score%/%10); score_ten

level<-switch (score_ten,
         "10"=,"9"="A",
         "8"="B",
         "7"="C",
         "6"="D","F"
         )
cat(score,'점은',level,'등급입니다.\n');

# 문제5
alpha <- paste(LETTERS,letters,sep='')
alpha

