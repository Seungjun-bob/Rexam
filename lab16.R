## 문제1 ##
emp <- read.csv('data/emp.csv' header = TRUE)
emp
#1
emp %>% filter(job == 'MANAGER')
#2
emp %>% select(empno, ename, sal)
#3
emp %>% select(-empno)
#4
emp %>% select(ename, sal)
#5
emp %>% count(job)
#6
emp %>% select(ename, sal, deptno) %>% filter(sal >= 1000 & sal <= 3000)
#7
emp %>% select(ename, job, sal) %>% filter(job != 'ANALYST')
#8
emp %>% select(ename, job) %>% filter(job == 'SALESMAN' | job == 'ANALYST')
#9
emp %>%
  group_by(deptno) %>% summarise( sal_sum = sum(sal)) 
#10
emp %>% arrange(sal)
#11
emp %>% arrange(desc(sal)) %>% head(1)
#12
empnew <- emp %>% rename(salary='sal', commrate='comm')
empnew
#13
emp %>% count(deptno) %>% tail(1)
#14
emp %>% 
  select(ename) %>% 
  mutate(enamelength = nchar(ename)) %>% 
  arrange(enamelength)
#15
emp %>% 
  filter(!is.na(comm)) %>% 
  summarise(n=length(comm)) 

## 문제2 ##
mpg <- as.data.frame(ggplot2::mpg)
#1
str(mpg)
#2
dim(mpg)
#3
mpg %>% head(10)
#4
mpg %>% tail(10)
#5
View(mpg) 
#6
summary(mpg)
#7
mpg %>% group_by(manufacturer) %>% tally()
mpg %>% count(manufacturer)
#8
mpg %>% group_by(manufacturer, model) %>% tally()

## 문제17 ##
#1
mpg %>% rename(city='cty', highway='hwy') %>% head()

## 문제 18 ##
#1 - displ 4 이하의 고속도로 연비가 더 높다
mpg %>% filter(displ <= 4) %>% 
  summarise(audi_mean_hwy = mean(hwy))
mpg %>% filter(displ >= 5) %>% 
  summarise(toyota_mean_hwy = mean(hwy))

#2 - toyota의 도시 연비가 더 높다
mpg %>% 
  filter(manufacturer == "audi") %>%
  summarise(audi_mean_cty = mean(cty))
mpg %>% 
  filter(manufacturer == "toyota") %>%
  summarise(toyota_mean_cty = mean(cty))

#3
mpg %>% 
  filter(manufacturer == "chevrolet" | manufacturer == "ford" | manufacturer == "honda") %>%
  summarise(mean_hwy = mean(hwy))

## 문제 19 ##
#1
mpg3 <- mpg %>%
  select(class, cty)
mpg3 %>% head()

#2 - compact의 연비가 평균 더 높다.
mpg3 %>% 
  filter(class == "suv") %>%
  summarise(mean_cty = mean(cty))
mpg3 %>% 
  filter(class == "compact") %>%
  summarise(mean_cty = mean(cty))

## 문제 20 ##
mpg %>% 
  filter(manufacturer == "audi") %>% 
  group_by(model) %>%
  arrange(desc(hwy)) %>%
  head()

