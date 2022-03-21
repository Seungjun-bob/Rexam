# 문제1
exam1 <- function(){
  alpha <- paste(LETTERS,letters,sep='')
  return(alpha)
}
exam1()

# 문제2
exam2 <- function(x) {
  sum <- 0;
  for(i in 1:x) {
    sum = sum+i
  }
  return(sum)
}
cat('함수 호출 결과 :',exam2(5),sep='')

# 문제3
exam3 <- function(x,y) {
  if(x>y){
    return(x-y)
  }else if(y>x){
    return(y-x)
  }else{
    return(0)
  }
}
print(paste('함수 호출 결과 :',exam3(3,6),sep=''))
print(paste('함수 호출 결과 :',exam3(10,2),sep=''))
print(paste('함수 호출 결과 :',exam3(3,3),sep=''))

# 문제4
exam4 <- function(x,op,y){
  return(switch(EXPR=op,
                '+'=return(x+y),
                '-'=return(x-y),
                '%/%'=if(x==0){
                  return(print("오류1"))
                }else if(y==0){
                  return(print("오류2"))
                }else{
                  return(x%/%y)
                },
                '%%'=if(x==0){
                  return(print("오류1"))
                }else if(y==0){
                  return(print("오류2"))
                }else{
                  return(x%%y)
                },print('규격의 연산자만 전달하세요')))
}
exam4(1,'-',4)
exam4(1,'+',4)
exam4(0,'%/%',4)
exam4(1,'%/%',0)
exam4(1,'%/%',4)
exam4(1,'%%',4)
exam4(1,'/',4)

# 문제5
exam5 <- function(n,s='#'){
  if (n<0){
    return()
  }
  for (i in 1:n){
    cat(s)
  }
  return()
}
exam5(4)
exam5(5,'$')
exam5(-1)

# 문제6
exam6 <- function(...){
  data <- (...)
  for (i in data){
    if (is.na(i)){
      print("NA는 처리불가", quote=FALSE)
    }
    else if (i >= 85){
      print(paste(i,'점은 상등급입니다.'), quote=FALSE)
    }else if (i >= 70){
      print(paste(i,'점은 중등급입니다.'), quote=FALSE)
    }else if (i < 70){
      print(paste(i,'점은 하등급입니다.'), quote=FALSE)
    }
  }
  return()
}

exam6(c(80,50,70,66,NA,35))





