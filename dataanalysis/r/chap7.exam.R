library(dplyr)

## - 7.2 Exam
mpg <- as.data.frame(ggplot2::mpg)           # mpg 데이터 불러오기
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA  # NA 할당하기

# - Q1. drv 변수와 hwy 변수에 결측치가 몇 개 있는가?
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# - Q2. 어떤 구동방식의 hwy 평균이 높은지 알아보자.
mpg %>% filter(!is.na(hwy)) %>%
  select(drv, hwy) %>%
  group_by(drv) %>%
  summarise(meanhwy = mean(hwy))

mpg %>% select(drv, hwy) %>%
  group_by(drv) %>%
  summarise(meanhwy = mean(hwy, na.rm=T))


# 결측치가 들어있는 mpg 데이터를 활용해서 문제를 해결해보세요. 
mpg <- as.data.frame(ggplot2::mpg)
rowna <- c(1, 8, 27, 89, 101, 73, 189, 211)
colna <- c(7, 9)
nas <- cbind(rowna, colna)
mpg[nas] <- NA

# • Q1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보자. 
## - 분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인하자. 
## - drv 변수와 hwy 변수에 결측치가 몇 개 있는지 알아보세요.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# • Q2. filter()를 이용해 hwy 변수의 결측치를 제외하고, 
## - 어떤 구동방식의 hwy 평균이 높은지 알아보세요. 
## - 하나의 dplyr 구문으로 만들어야 합니다.
mean_hwy <- mpg %>% filter(!is.na(hwy)) %>%
  group_by(drv) %>%
  summarise(mean_hwy=mean(hwy))
mean_hwy

# • Q3. drv 그룹별 hwy의 평균으로 결측치를 대체하고자 한다면?
summary(mpg$hwy)

mpg$newhwy <- ifelse(!is.na(mpg$hwy), mpg$hwy,
                  ifelse(mpg$drv=="4", mean_hwy[mean_hwy[,1]=="4", 2],
                         ifelse(mpg$drv=="f", mean_hwy[mean_hwy[,1]=="f", 2],
                                ifelse(mpg$drv=="r", mean_hwy[mean_hwy[,1]=="r", 2], NA))))

## - group별 함수적용 tapply. 리턴값은 list.
tapply(1:10, rep(1:2, 5), sum)
class(tapply(1:10, rep(1:2, 5), sum))

meanImp <- function(x, y, f){
  ifelse(is.na(x),
         tapply(x, y, f, na.rm=T)[y], x)
}

meanImp(mpg$hwy, mpg$drv, mean)[1:5]
mpg$hwy[1:5]

## join을 이용하면 - 제일 바람직하다.:
left_join(mpg, mean_hwy, by = 'drv') %>%
  mutate(muhwy = ifelse(is.na(hwy), mean_hwy, hwy))
  

## 7.3 exam ===========================
# 이상치가 들어있는 mpg 데이터를 활용해서 문제를 해결해보세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29,43,129,203), "cty"] <- c(3,4,39, 42)
# 구동방식별로 도시 연비가 다른지 알아보려고 합니다. 
# - 분석을 하려면 우선 두 변수에 이상치가 있는지 확인하려고 합니다. 
# • Q1. drv에 이상치가 있는지 확인하세요. 
# 이상치를 결측 처리한 다음 이상치가 사라졌는지 확인하세요. 
# 결측 처리 할 때는 %in% 기호를 활용하세요.
table(mpg$drv)
normal_drv <- c("4", "f","r")
mpg$drv <- ifelse(mpg$drv %in% normal_drv, mpg$drv, NA)
table(mpg$drv)

# 열 하나만 변경하면 되는데, pipe를 사용하면 df 전체를 변경한다.
mpg <- mpg %>% mutate(drv = ifelse(drv %in% normal_drv, drv, NA))


# • Q2. 상자 그림을 이용해서 cty에 이상치가 있는지 확인하세요. 
# 상자 그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측 처리한 후 
# 다시 상자 그림을 만들어 이상치가 사라졌는지 확인하세요. 
stat_cty<-boxplot(mpg$cty)
stat_cty$stats
condit = mpg$cty < stat_cty$stats[1] | mpg$cty > stat_cty$stats[5]
mpg$cty <- ifelse(condit, NA, mpg$cty)
boxplot(mpg$cty)


# • Q3. 두 변수의 이상치를 결측처리 했으니 이제 분석할 차례입니다. 
# 이상치를 제외한 다음 drv별로 cty 평균이 어떻게 다른지 알아보세요. 
# 하나의 dplyr 구문으로 만들어야 합니다
mpg %>% na.omit() %>%
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))




## 나중을 위한 데이터 
library(foreign)
write.csv(read.spss("Data/한국행정연구원_인공지능 기술 확산에 따른 위험 거버넌스 연구_데이터_2017.sav",
                    reencode="cp949",
                    o.data.frame = T),
          file="Data/KuiWon.csv")
df <- read.csv("Data/KuiWon.csv")
head(df)
