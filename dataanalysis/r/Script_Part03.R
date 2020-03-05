### 3장. 데이터분석을 위한 연장 챙기기
#### 03-1 변수 이해 ####
rm(list=ls())
# rm(list=c('v1', 'v2'))

v1 = c(1,3,5)
v1
v2 = c(0,2,4,6,7)
v1*v2
class(v1*v2)
v1 %*% v2 # V1 dot v2. 벡터의 내적. 행렬곱.
v1 %*% v1 == sum(v1*v1)
sum(v1*v2)
rep(v1, 3)


## ---------------------------------------------------------------------- ##
a
a <- 1  # a에 1 할당
a       # a 출력

b
b <- 2
b

c <- 3 
c

d <- 3.5
d

f <- "I am a boy"

a+b

a+b+c

4/b

5*b


## -------------------------------------------------------------------- ##
var1 <- c(1, 2, 5, 7, 8)    # 숫자 다섯 개로 구성된 var1 생성
var1
# - 정렬과 색인의 이해 추가할 것.

comp <- c(1, "abc") # type casting이 발생한다.
comp

var2 <- c(1:5)      # 1~5까지 연속값으로 var2 생성
var2
var2 <- 1:5

var3 <- seq(1, 5)           # 1~5까지 연속값으로 var3 생성
var3
var4 <- seq(1,10)
var4 <- seq(1, 10, by = 2)  # 1~10까지 2 간격 연속값으로 var4 생성
var4

var5 <- seq(1, 10, by = 3)  # 1~10까지 3 간격 연속값으로 var5 생성
var5

var1
var1+2
var1 + c(2,2,2,2,2)
length(var1)
var1 + c(3,2,1)

var1
var2
var1+var2
var5 <- c(5,6,5,6)
var1 + var5

n1 <- 1:20
cut(n1, 5)
class(cut(n1, 5))

# Q: v1과 V2를 결합하여 아래와 같은 벡터 q를 생성하라.
v1
v2
### 1 3 5 0 2 4 6 7
q <- c(v1, v2)
q
# - 벡터 q를 정렬한 결과를 출력하라.
sort(q)
# - 벡터 q에서 top3의 색인을 순서대로 출력하라.
order(q, decreasing = T)[1:3]

# - 위의 결과를 이용하여 top3를 출력하라.
q[order(q, decreasing = T)[1:3]]
q[order(q, decreasing = T)][1:3]

# - 벡터 q의 순서를 역순으로 바꾸어라.
q
q[seq(length(q), 1, -1)]

# - 벡터 q에서 짝수만 출력하라.
q %% 2 # - 나머지
q %/% 2 # - 몫 
q[q %% 2 == 0]

# - 0 부터 10까지의 수 중에 짝수만 출력하라.
seq(0, 10, 2)
# - 벡터 q에서 짝수 위치의 값인 [4,5,6,7]만 출력하라.
which(q %% 2 == 0)
q

set.seed(123)
# - 벡터 q에서 랜덤하게 중복을 허용하여 10개를 수를 추출하라. 
sample(q, 10, replace = T)
# - 벡터 q에서 랜덤하게 중복없이 4개의 수를 추출하라.
sample(q, 4)
# - 변수 v1, v2를 삭제하라.
rm(v1, v2)

(x = 1:6)
(p = 1:6 / sum(1:6))
sum(p)
sample(x, 100, replace = T, p=p)
table(sample(x, 10000, replace = T, p=p)) / 10000

rm(list = ls(pattern = "v\\d"))

## -------------------------------------------------------------------- ##
str1 <- "a"
str1

str2 <- "text"
str2

str3 <- "Hello World!"
str3

str4 <- c("a", "b", "c")
str4

str5 <- c("Hello!", "World", "is", "good!")
str5

# str1+str2
# str1*str2

str6 <- c("a", 1)
mode(str6)

as.character(var1)

str7 = c("1", "2")
as.numeric(str7)

## - grep(pattern, x, ignore.case=F, fixed=F)
## - pattern이 존재하는 x 성분의 index를 반환
grep("a", "I have a mail")

# Q: 아래 url을 참고하여, 
# - https://rfriend.tistory.com/37
# - "I have a mail"을 단어단위로 쪼개고,
s1 <- strsplit("I have a mail", ' ')
s1 <- unlist(s1)
class(s1)
# - "a"가 존재하는 단어 색인을 출력하라.
grep('a', s1)
# - str5에서 "o"가 존재하는 성분을 출력하라.
str5
grep('o', str5)
grepl('o', str5)
str5[grep('o', str5)] # fancy 색인을 취함.
str5[grepl('o', str5)]# bool  색인을 취함.


#### 03-2 함수 이해하기 ####

## -------------------------------------------------------------------- ##
# 변수 만들기
x <- c(1, 2, 3)
x

# 함수 적용하기
mean(x)
max(x)
min(x)
median(x)
var(x)
sd(x)

str5
paste(str5, collapse = ",")  # 쉼표를 구분자로 str4의 단어들 하나로 합치기
paste(str5, collapse = " ")
str5
str3
paste(str5, str3, sep = ",") # 두개의 벡터를 성분별로 합치기.

x_mean <- mean(x)
x_mean

str5_paste <- paste(str5, collapse = " ")
str5_paste


#### 03-3 패키지의 이해 ####

## -------------------------------------------------------------------- ##
install.packages("ggplot2")  # ggplot2 패키지 설치
library(ggplot2)             # ggplot2 패키지 로드

# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")
x

y <- c(1,3,11,7,2,9,15,18)

# 빈도 그래프 출력
qplot(x, geom="histogram", bins=3)
hist(y)
qplot(y, geom="histogram", bins=5)


## -------------------------------------------------------------------- ##
# data에 mpg, x축에 hwy 변수 지정하여 그래프 생성
mpg<-mpg
mpg[7:11]

qplot(data = mpg, x = hwy, bins=20)
summary(mpg$hwy)

# x축 cty
qplot(data = mpg, x = cty, bins=20)

# x축 drv, y축 hwy
qplot(data = mpg, x = drv, y = hwy)

# x축 drv, y축 hwy, 선 그래프 형태
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

# qplot 함수 매뉴얼 출력
?qplot

example(qplot)


# Q: mpg 데이터에 대해 qplot으로 ..
# - cty와 hwy간 산점도를 그리고, hwy ~ cty의 회귀선을 추가하라.
qplot(cty, hwy, data=mpg) +
  geom_smooth(method = "lm", se = T)

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = F)

# - cyl 별 cty와 hwy간 산점도를 그려라.
qplot(cty, hwy, data=mpg, facets = ~ cyl)

# - cyl 별 hwy에 대한 boxplot을 그려라.
qplot(factor(cyl), hwy, data=mpg, geom="boxplot")

# - 제조사별 모델별 바챠트를 작성하라.
qplot(manufacturer, data=mpg, geom='bar') + coord_flip()
qplot(model, data=mpg, geom='bar') + coord_flip()

manuf_Mod = paste(mpg$manufacturer, mpg$model, sep=' | ')
qplot(manuf_Mod, geom='bar') + coord_flip()
