# 문제1
countEvenOdd <- function(x){
  even <- 0
  odd <- 0
  if (!is.numeric(x)){
    return()
  }else{
    for (num in (x)){
      if (num %% 2 ==0){
        even = even + 1
      }else {
        odd = odd + 1
      }
    }
  }
  return(list(even=even,odd=odd))
}
countEvenOdd(c(1:9))

# 문제2
vmSum <- function(x){
  if (!is.vector(x)){
    print("벡터만 전달하숑!")
  }
  if (!is.numeric(x)){
    print("숫자 벡터를 전달하숑!")
    return(0)
  }else{
    sum <- 0
    for (i in x){
      sum = sum + i
    }
  }
  return(sum)
}
vmSum(c(1:10))
vmSum(array(3))
vmSum(letters)

# 문제3
vmSum2 <- function(x){
  if (!is.vector(x)){
    stop("벡터만 전달하숑!")
  }
  if (!is.numeric(x)){
    warning("숫자 벡터를 전달하숑!")
    return(0)
  }else{
    sum <- 0
    for (i in x){
      sum = sum + i
    }
  }
  return(sum)
}
vmSum2(c(1:10))
vmSum2(array(3))
vmSum2(letters)

# 문제4
mySum <- function(x){
  oddSum <- 0
  evenSum <- 0
  if (is.null(x)){
    return()
  }
  if (!is.vector(x)){
    stop("벡터만 처리 가능!!")
  }
  if(any(is.na(x))){
    warning("NA를 최저값으로 변경하여 처리함!!")
    x[is.na(x)] = min(x, na.rm = TRUE)
  }
  for (i in x){
    if (i %% 2 == 0){
      evenSum = evenSum + i
    }else{
      oddSum = oddSum + i
    }
  }
  return(list(evenSum=evenSum, oddSum=oddSum))
}
mySum(array(1:10))
mySum(c(2, NULL, 3, NA, 5, NA, 7))
mySum(NULL)


# 문제5
myExpr <- function(x) {
  if (!is.function(x)){
    stop("수행 안할꺼임!")
  }
  return(func())
}
func <- function() {
  num <- sample(1:45,6)
  return(num)
}
myExpr(func)

# 문제7
createVector1 <- function() {
  
}





