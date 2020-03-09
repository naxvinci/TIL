#### 4장. data.frame #######
#### 04-2 데이터 프레임 이해 ####
rm(list=ls())
## ---------------------------------------------------------------------- ##

english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
english

math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
math

# english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm
df_midterm[2]
df_midterm["math"]
df_midterm$math # df_midterm.math
df_midterm[1:2]
## - 행, 열 구분없이 색인하면, 열을 가져온다.
## - 모든 것을 선택하는데, :를 사용해서는 안된다.
## - 연속색인에서 끝 첨자를 포함한다.

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm$class <- class
df_midterm["class"] <- class
df_midterm[4] <- class
names(df_midterm)[4] <- "class2"
names(df_midterm)[3:4] <- c("class1", "class2")
df_midterm

mean(df_midterm$english)  # df_midterm의 english로 평균 산출
mean(df_midterm$math)     # df_midterm의 math로 평균 산술
# python은 reduce 대상축(0), r은 직접 연산 대상(2)
apply(df_midterm, 2, mean)

df_midterm[1:2]
summary(df_midterm[1:2])

rm(english, math, class)

df_midterm <- data.frame(english <- c(90, 80, 60, 70),
                         math <- c(50, 60, 100, 20),
                         class <- c(1, 1, 2, 2))
df_midterm
rm(df_midterm, english, math, class)

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

df<-df_midterm
## - vector
df$math
df[,2]
df[,'math']
## - 1 column data.frame
df[2]
df["math"]

## - 행 삽입하기.
df[5,] <- c(50, 60, 1)

head(df)
1:3 == c(1,2,3)

# - 순서와 이름에 의한 색인을 섞어 쓸 수 있다.
df[1:3, c('math', 'english')]
df[1:3, c(2,1)]
df[1,]
df[2,3]
df[c(1,3,4),]
df[c(1,3,4), c(1,3)]
df[c(1,3,4), c("english", "class")]

class(df[2])
str(df[,2])
a<-1
str(a)
dim(df)

# Quiz 4-2:
fruits <- c("사과", "딸기", "수박")
price <- c(1800, 1500, 3000)
amount <- c(24, 38, 13)
df2 <- data.frame(fruits, price, amount)
df2

meaned <- apply(df2[2:3], 2, mean)
meaned
names(meaned) <- NULL


#### 04-3 ####
rm(list=ls())
getwd()
## -------------------------------------------------------------------- ##
install.packages("readxl")
library(readxl)

# 엑셀 파일을 불러와서 df_exam에 할당
df_exam <- read_excel("Data/excel_exam.xlsx")
df_exam   # 출력

mean(df_exam$english)
mean(df_exam$science)
summary(df_exam$english)

## quiz: 
# 1. math와 science 만을 선택하는 4가지 방법을 작성
df_exam[c("math", "science")]
df_exam[c(3,5)]
df_exam[,c("math", "science")]
df_exam[,c(3,5)]
df_exam[c(1,2),]

# 2. math, english, science의 점수 합을 값으로 갖는 sum이라는 열을 생성하라.
df_exam['sum'] <- df_exam$math + df_exam$english + df_exam$science
df_exam['sum'] <- apply(df_exam[3:5], 1, sum)
head(df_exam)

# 3. sum이라는 열의 값이 150이상 180 이하인 행만 선택하라.
cond <- df_exam$sum >= 150 & df_exam$sum <= 180
df_exam[cond,]

# 4. 각 반별로 science의 최고점과 최저점인 학생 id를 구하라.
classes <- unique(df_exam$class)
for (cls in classes){
  tmp <- df_exam[df_exam$class==cls, c(1,5)]
  tmp <- as.data.frame(tmp)
  min <- min(tmp$science)
  max <- max(tmp$science)
  print(as.character(cls))
  print(tmp[tmp$science==min, 'id'])
  print(tmp[tmp$science==max, 'id'])
}
## - quiz end


# ------- 컬럼명이 없는 파일을 읽으면:
df_exam_novar <- read_excel("Data/excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("Data/excel_exam_novar.xlsx", col_names = F)
df_exam_novar

# Q: 
# - df_exam_novar에 아래와 같은 컬러명을 적용하라.
# - c("id", "class", "math", "eng", "sci")
names(df_exam_novar) <- c("id", "class", "math", "eng", "sci")
head(df_exam_novar)

# 엑셀 파일의 세 번째 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel("Data/excel_exam_sheet.xlsx", sheet=3)
df_exam_sheet


## -------------------------------------------------------------------- ##
df_csv_exam <- read.csv("Data/csv_exam.csv")
class(df_csv_exam)

df_csv_exam <- read.csv("Data/csv_exam.csv", stringsAsFactors = F)


## -------------------------------------------------------------------- ##
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

write.csv(df_midterm, file = "Data/df_midterm.csv")


## -------------------------------------------------------------------- ##
save(df_midterm, file = "Data/df_midterm.rdata")

rm(df_midterm)

load("Data/df_midterm.rdata")

# 정리하면:
# - 알려진 파일 형식: read, write
# - rdata 형식: load, save


## -------------------------------------------------------------------- ##
# 1.변수 만들기, 데이터 프레임 만들기
english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
data.frame(english, math)     # 데이터 프레임 생성

# 2. 외부 데이터 이용하기

# 엑셀 파일
library(readxl)                                 # readxl 패키지 로드
df_exam <- read_excel("Data/excel_exam.xlsx")        # 엑셀 파일 불러오기

# CSV 파일
df_csv_exam <- read.csv("Data/csv_exam.csv")         # CSV 파일 불러오기
write.csv(df_midterm, file = "df_midterm.csv")  # CSV 파일로 저장하기

# Rda 파일
load("Data/df_midterm.rda")                          # Rda 파일 불러오기
save(df_midterm, file = "df_midterm.rda")       # Rda 파일로 저장하기

