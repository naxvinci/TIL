# ggplot2의 이해
# - Grammer of Graphics
# - 대표적인 2가지 함수 :
#   qplot: quick plot. 빠른 그래픽 함수 
#   ggplot: Grammer of Graphics. 체계적인 그래픽 함수
#   1) 데이터 추가, 2) aesthetic 추가 3) geom(선, 점) 추가 4) 옵션 추가

library(ggplot2)
library(dplyr)
head(iris)
dim(iris)

ggplot(iris, aes(Sepal.Length, Sepal.Width))
ggplot(iris, aes(Sepal.Length, Sepal.Width)) + 
  geom_point()

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, 
                 shape=Species, color=Petal.Width, 
                 size=Petal.Length)) + 
  geom_point()

# aes 함수 즉, aesthetic의 구성요소 
# x, y, alpha, color, fill, shape, size
## - color, shape, size : 점, 선에 적용
## - fill : 막대에 적용

# aes에서 명시하지 않은 요소는 geom에서 추가로 aes를 명시할 수 있다.

ggplot(iris) + geom_point(aes(x=Sepal.Length, y=Sepal.Width))
# geom_point에서 설정가능한 aes 요소: x, y, alpha, color, shape, size



## - 산점도 그리기(1) 
b <- ggplot(iris)
b + geom_point(aes(x=Sepal.Length, y=Sepal.Width))
# - 산점도 그리기(2): shape을 변경하기
b + geom_point(aes(x=Sepal.Length, y=Sepal.Width, shape=Species))
# - 산점도 그리기(3): color를 변경하기
b + geom_point(aes(x=Sepal.Length, y=Sepal.Width, color=Species))
#- 산점도 그리기(3): size를 변경하기
# theme_update(plot.title = element_text(hjust = 0.5))
ggplot(iris, aes(Sepal.Length, Sepal.Width, 
                 color=Species, size=Petal.Width)) + 
  geom_point() + 
  ggtitle("Sepal.Length vs. Sepal.Width") +
  theme(plot.title = element_text(hjust = 0.5))

#### 아래 이미지로 어떻게 분류가 가능한지를 검토해보자.
ggplot(iris, aes(Sepal.Length, Petal.Width, 
                 color=Species, size=Sepal.Width)) + 
  geom_point() + 
  ggtitle("Sepal.Length vs. Petal.Width") +
  theme(plot.title = element_text(hjust = 0.5))




## - bar 챠트 그리기(1) : 단일 범주형 변수
table(iris$Species)
b + geom_bar(aes(Species))
b + geom_bar(aes(Species), stat='count') # x만 지정된 경우 stat의 default 값

## - bar 챠트 그리기(2): 범주 + 빈도의 빈도표 그리기
ggplot(iris, aes(Species, Sepal.Length)) + geom_bar(stat = "identity")
### -- plot의 색 바꾸기
ggplot(iris, aes(Species, Sepal.Length, fill=Species)) + 
  geom_bar(stat = "identity")
## - identity의 의미 이해:
# - identity는 y축 값의 높이를 데이터를 기반으로 정해줄 때 사용해줍니다. 
# - 즉, stat='identity'는 y축의 높이를 데이터의 값으로 하는 
# - bar그래프의 형태로 지정한다는 것입니다.
iris %>% group_by(Species) %>%
  select(Sepal.Length) %>%
  summarise(sum_sl = sum(Sepal.Length))

## - bar 챠트 그리기(2): 범주 + 빈도의 빈도율 그리기
ggplot(iris, aes(Species, Sepal.Length/sum(Sepal.Length), fill=Species)) + 
  geom_bar(stat = "identity") + 
  scale_y_continuous(labels=scales::percent) +
  ylab("relative frequencies")

## - bar 챠트 그리기(3): 범주 + 빈도에서 범주 순서 선택하기
ggplot(iris, aes(Species, Sepal.Length, fill=Species)) + 
  geom_bar(stat = "identity") +
  scale_x_discrete(limits = c("virginica", "versicolor"))

## - bar 챠트 그리기(4): 범주 + 그룹 + 빈도에서 누적 빈도 그리기
iris %>% group_by(Species) %>%
  summarise(meanSL = mean(Sepal.Length),
            meanSW = mean(Sepal.Width),
            meanPL = mean(Petal.Length),
            meanPW = mean(Petal.Width)) -> meanIris
install.packages("reshape2")
library(reshape2)
meanIris <- melt(meanIris, id.vars=c("Species"))

ggplot(meanIris, aes(Species, value, fill=variable)) + 
  geom_bar(stat = "identity")
ggplot(meanIris, aes(Species, value, fill=variable)) + 
  geom_bar(stat = "identity", position = 'dodge')

## - bar 챠트 그리기(4): 범주 + 그룹 + 빈도에서 facet grid 그리기
ggplot(tips, aes(x= day,  group=sex)) + 
  geom_bar(aes(y = ..prop.., fill = factor(..x..)), stat="count") +
  geom_text(aes( label = scales::percent(..prop..),
                 y= ..prop.. ), stat= "count", vjust = -.5) +
  labs(y = "Percent", fill="day") +
  facet_grid(~sex) +
  scale_y_continuous(labels = scales::percent)

## - Quiz: meanIris를 이용하여, variable별로 facet grid bar chart 작성하기



## histogram 그리기
d <- ggplot(iris, aes(Sepal.Length))
d + stat_bin()
d + stat_bin(binwidth = 0.2)
d + geom_histogram(binwidth = 0.2)
d + geom_histogram(bins = 30)기



## boxplot 그리기(1): 단일 연속변수 y
d2 <- ggplot(iris, aes(y=Sepal.Length))
d2 + geom_boxplot()

## - boxplot 그리기(2): 범주 x별 연속변수 y
d3 <- ggplot(iris, aes(Species, Sepal.Length, color=Species))
d3 + geom_boxplot()


# getwd()
# source("Script/11.1.ggmap.R", encoding="utf-8")

# 추가학습: https://statkclee.github.io/R-ecology-lesson/kr/05-visualization-ggplot2.html
