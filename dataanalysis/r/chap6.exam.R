# 6.2절 exam: mpg 데이터를 이용해 분석 문제를 해결해 보세요. 
library(dplyr)
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

#• Q1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 합니다. 
# displ(배기량)이 4 이하인 자동차와 5 이상인 자동차 중 
# 어떤 자동차의 hwy(고속도로 연비)가 평균적으로 더 높은지 알아보세요. 
dim(mpg)
mpg$cdispl <- ifelse(mpg$displ <= 4, "low",
                     ifelse(mpg$displ >= 5, "high", NA))
table(mpg$cdispl)
mpglow <- mpg %>% filter(cdispl == "low")
mean(mpglow$hwy)
mpghigh <- mpg %>% filter(cdispl == "high")
mean(mpghigh$hwy)


# 더 단순화하면:
mpg %>% select(displ, hwy) %>%
  mutate(cdispl = ifelse(mpg$displ <= 4, "low",
                         ifelse(mpg$displ >= 5, "high", NA))) %>%
  group_by(cdispl) %>%
  summarise(meanhwy = mean(hwy), count = n())


#• Q2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 합니다. 
# "audi"와 "toyota" 중 어느 제조회사의 cty(도시 연비)가 평균적으로 더 높은지 알아보세요. 
audi <- mpg %>% filter(manufacturer == "audi")
mean(audi$cty)
toyota <- mpg %>% filter(manufacturer == "toyota")
mean(toyota$cty)

# - dplyr 함수만을 이용하는 방법 
mpg %>% filter(manufacturer %in% c('audi', 'toyota')) %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty))


#• Q3. "chevrolet", "ford", "honda" 자동차의 고속도로 연비 평균을 알아보려고 합니다. 
# 이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보세요.
interest_brand = c("chevrolet", "ford", "honda")

brands <- mpg %>% filter(manufacturer %in% interest_brand)
mean(brands$hwy)

# - dplyr 함수만을 이용하는 방법 
mpg %>% filter(manufacturer %in% interest_brand) %>%
  summarise(mean_hwy = mean(hwy))


## - 6.3 exam
# `mpg` 데이터를 이용해서 분석 문제를 해결해보세요.

# - Q1. `mpg` 데이터는 11개 변수로 구성되어 있습니다. 
# 이 중 일부만 추출해서 분석에 활용하려고 합니다. 
# `mpg` 데이터에서 `class`(자동차 종류), `cty`(도시 연비) 변수를 
#  - 추출해 새로운 데이터를 만드세요. 
# 새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인하세요.
mpg <- as.data.frame(ggplot2::mpg)
new_mpg <- mpg %>% select(class, cty)
head(new_mpg)

# - Q2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 합니다. 
# 앞에서 추출한 데이터를 이용해서 
# `class`(자동차 종류)가 `"suv"`인 자동차와 `"compact"`인 자동차 중 
# 어떤 자동차의 `cty`(도시 연비)가 더 높은지 알아보세요.

suv <- new_mpg %>% filter( class == 'suv')
mean(suv$cty)
compact <- new_mpg %>% filter( class == 'compact')
mean(compact$cty)

intr_class <- c("suv", "compact")
new_mpg %>% filter( class %in% intr_class) %>%
  group_by(class) %>%
  summarise(mean_cty = mean(cty))


## - 6.4 exam
# - `"audi"`에서 생산한 자동차 중에, 
# 어떤 자동차 모델의 `hwy`(고속도로 연비)가 높은지 알아보려고 합니다. `"audi"`에서 생산한 자동차 중 `hwy`가 1~5위에 해당하는 자동차의 데이터를 출력하세요.

# 1. audi에서 생산한 자동차만 추출하여,
# 2. model별로 group하고,
# 3. hwy의 평균을 구하고,
# 4. hwy가 큰 것이 좋은 순위이므로(?), 내림차순으로 정렬하여,
# 6. 상위 5개만 출력한다.
audi <- mpg %>% filter(manufacturer=='audi') %>%
  select(model, hwy)

audimodel <- unique(audi$model)
for (m in audimodel){
  print(m)
  print(mean(audi[audi$model==m, "hwy"]))
}

mpg %>% filter(manufacturer=='audi') %>%
  group_by(model) %>%
  summarise(mh = mean(hwy)) %>%
  arrange(desc(mh)) %>%
  head(5)

## - 6.5 exam
# Q1. mpg 데이터 복사본을 만들고, 
# cty와 hwy를 더한 ’합산 연비 변수’를 추가하세요.

# Q2. 앞에서 만든 ’합산 연비 변수’를 2로 나눠 
# ’평균 연비 변수’를 추가세요.

# Q3. ’평균 연비 변수’가 가장 높은 
# 자동차 3종의 데이터를 출력하세요.

# Q4. 1~3번 문제를 해결할 수 있는 하나로 
# 연결된 dplyr 구문을 만들어 출력하세요. 
# 데이터는 복사본 대신 mpg 원본을 이용하세요.
mpg %>% mutate(total = cty + hwy,
               meanmpg = total/2) %>%
  arrange(desc(meanmpg)) %>% head(3)

# 만약 모델별 평균 meanmpg가 높은 차종을 3개 출력하려면:
mpg %>% mutate(total = cty + hwy,
               meanmpg = total/2) %>%
  group_by(model) %>%
  summarise(means = mean(meanmpg)) %>%
  arrange(desc(means)) %>% head(3)


## - 6.6 exam
# `mpg` 데이터를 이용해서 분석 문제를 해결해 보세요.
# 
# - Q1. `mpg` 데이터의 `class`는 `"suv"`, `"compact"` 등 
# 자동차를 특징에 따라 일곱 종류로 분류한 변수입니다. 
# 어떤 차종의 연비가 높은지 비교해보려고 합니다. 
# `class`별 `cty` 평균을 구해보세요.

# 1. class로 그룹하여,
# 2. cty의 평균 mean_cty을 구하고
# 3. mean_cty를 내림차순으로 정렬하여,
# 4. 출력한다.

mpg %>% group_by(class) %>%
  summarise(mean_cty = mean(cty))


# - Q2. 앞 문제의 출력 결과는 `class` 값 알파벳 순으로 정렬되어 있습니다. 
# 어떤 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록 
# `cty` 평균이 높은 순으로 정렬해 출력하세요.
mpg %>% group_by(class) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty))

# - Q3. 어떤 회사 자동차의 `hwy`(고속도로 연비)가 가장 높은지 알아보려고 합니다. 
# `hwy` 평균이 가장 높은 회사 세 곳을 출력하세요.
# 1. 회사별로 그룹하고,
# 2. hwy의 평균 mean_hwy를 구하고,
# 3. mean_hwy에 대해 내림차순으로 정렬한 후
# 4. 첫 3개를 출력한다.
mpg %>% group_by(manufacturer) %>%
  summarise(mean_hwy = mean(hwy)) %>%
  arrange(desc(mean_hwy)) %>%
  head(3)

# - Q4. 어떤 회사에서 `"compact"`(경차) 차종을 가장 많이 생산하는지 알아보려고 합니다. 
# 각 회사별 `"compact"` 차종 수를 내림차순으로 정렬해 출력하세요.
# 1. class가 "compact"인 행만 필터링하고,
# 2. 회사별로 그룹하여
# 4. 그 수를 세어 n이란 이름의 변수로 생성한 후,
# 4. n에 대해 내림차순으로 정렬한 후, 출력한다.
n(mpg$class)

mpg %>% filter(class == "compact") %>%
  group_by(manufacturer) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) 


# - 6.7 exam
mpg %>% distinct(fl)
fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel  # 출력
left_join(mpg, fuel, by="fl") %>% View()



#### - challenge exam
# 미국 동북중부 437개 지역(county)의 인구통계 정보를 담고 있는 
## - midwest 데이터를 사용해 데이터 분석 문제를 해결해 보세요. 
## - midwest는 ggplot2 패키지에 들어 있습니다. 
midwest <- as.data.frame(ggplot2::midwest)

# • 문제1. popadults는 해당 지역의 성인 인구, poptotal은 전체 인구를 나타냅니다. 
## - midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 
## - minor_rate 변수를 추가하세요. 
# 
# 미성년 인구수: poptotal - popadults
# 전체인구 대배 미성연 인구수 : (poptotal - popadults)/poptoal*100
# mutate(data, v_name = expression)

kkk <- midwest %>% 
  mutate(minor_rate = (poptotal - popadults)*100/poptotal)

head(kkk)
kkk$minor_rate


# • 문제2. 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의 
## - 미성년 인구 백분율을 출력하세요.
kkk %>% select(county, minor_rate) %>%
  arrange(desc(minor_rate)) %>%
  head(5)


# • 문제3. 분류표의 기준에 따라 미성년 비율 등급 변수 minor_grade를 추가하고, 
## - 각 등급에 몇 개의 지역(state, county)이 있는지 알아보세요.
# minor_rate 분류기준
# large : 40% 이상
# middle : 30% ~ 40% 미만
# small : 30% 미만 

# ifelse(condition, TrueValue, FalseValue)
# ifelse(condition, TrueValue, ifelse(condition2, TrueValue2, FalseValue2))

kkk$minor_grade <- ifelse(kkk$minor_rate >= 40, "large",
                              ifelse(kkk$minor_rate >= 30, "middle",
                                     "small"))

dim(midwest)[1] == dim(midwest %>% distinct(state, county))[1]
dim(distinct(midwest, state, county))

kkk %>% select(state, county, minor_grade) %>%
  group_by(minor_grade) %>%
  summarise(n=n())


# • 문제4. popasian은 해당 지역의 아시아인 인구를 나타냅니다. 
## - '전체 인구 대비 아시아인 인구 백분율' 변수를 추가하고, 
## - 하위 10개 지역의 state(주), county(지역명), 아시아인 인구 백분율(asian_rate)을 
## - 출력하세요.
# 아시안인구 / 전체인구 * 100

kkk %>% 
  mutate(asian_rate = popasian*100/poptotal) %>%
  select(state, county, asian_rate) %>%
  arrange(asian_rate) %>% head(10)

kkk[kkk$county == "MENOMINEE",]

