library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

names(mpg)
mpg <- rename(mpg, city=cty, highway=hwy)
head(mpg)


## - 5장 exam ------
midwest <- as.data.frame(ggplot2::midwest)

# 1) 데이터의 특성 파악하기 
str(midwest)
summary(midwest)

# - 문자열 변수에 대한 빈도표 작성 
cnames <- names(midwest)
class(midwest$category) == "character"
for (name in cnames){
  print(name)
}
for (name in cnames){
  # midwest$name
  if(class(midwest[,name]) == "character"){
    print(paste("====", name, "===="))
    print(table(midwest[,name]))
  }
}
# paste("abd","cd")


# 2) 변수명 수정 
midwest <- rename(midwest, total=poptotal, asian=popasian)


# 3) 파생변수 생성 및 histogram
midwest$asian.ratio <- (midwest$asian / midwest$total) * 100
midwest[1:5, c('percasian', 'asian.ratio')]

hist(midwest$asian.ratio, nclass = 20)


# 4) 아시아 인구 백분률 전체 평균관련 파생변수
mean.asian.ratio <- mean(midwest$asian.ratio)
mean.asian.ratio

total.asian.ratio <- sum(midwest$asian)/ sum(midwest$total) * 100
total.asian.ratio

qplot(total, asian.ratio, data=midwest)

midwest$asian.grade <- ifelse(midwest$asian.ratio > mean.asian.ratio,
                              "large", "small")

table(midwest$asian.grade)
qplot(midwest$asian.grade)


## -----------
