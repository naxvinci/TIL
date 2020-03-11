## 9장. 데이터분석 프로젝트
"한국인의 삶을 파악해보자."
#### 09-1 '한국복지패널데이터 ####
# • 한국보건사회연구원 발간
# • 가구의 경제활동을 연구해 정책 지원에 반영할 목적
# • 2006~2015년까지 전국에서 7000여 가구를 선정해 매년 추적 조사
# • 경제활동, 생활실태, 복지욕구 등 수천 개 변수에 대한 정보로 구성

rm(list=ls())
## 09-1. ‘한국복지패널데이터’ 분석 준비하기 ---------------------------- ##
# install.packages("foreign")  # foreign 패키지 설치

library(foreign)             # SPSS 파일 로드
library(dplyr)               # 전처리
library(ggplot2)             # 시각화
library(readxl)              # 엑셀 파일 불러오기

# download : http://bit.ly/Koweps_hpc10_2015_v2

# 데이터 불러오기
raw_welfare <- read.spss(file = "Data/Koweps_hpc10_2015_beta1.sav",
                         to.data.frame = T)
View(raw_welfare[1:3,])
# 복사본 만들기
welfare <- raw_welfare

head(welfare)
tail(welfare)
View(welfare[1:3,])
dim(welfare) # 16664 957
str(welfare)
summary(welfare)

# p211. 직종코드집 참고하기: Data/Koweps_Codebook.xlsx
welfare <- rename(welfare,
                  sex = h10_g3,            # 성별
                  birth = h10_g4,          # 태어난 연도
                  marriage = h10_g10,      # 혼인 상태
                  religion = h10_g11,      # 종교
                  income = p1002_8aq1,     # 월급
                  code_job = h10_eco9,     # 직종 코드
                  code_region = h10_reg7)  # 지역 코드

welfare <- welfare %>% select(sex, birth, marriage,
                              religion, income, code_job,
                              code_region)

# rm(raw_welfare)
save(welfare, file="welfare.rData")
# 데이터 분석 절차 참고 p212

#### 09-2 성별에 따른 월급 차이 ####

## --"성별에 따라 월급이 다를까?"-------------------- ##
class(welfare$sex)
table(welfare$sex)

# 이상치 확인
table(welfare$sex)

# 이상치 결측 처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

# 결측치 확인
table(is.na(welfare$sex))

# 성별 항목 이름 부여: 코드 표 참조.
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

# - Quiz: sex를 factor로 바꾸어라. 이때 male을 1, female은 2로 코딩한다.


## ----- 월급 변수 검토 및 전처리 ----------------------------- ##
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
library(fBasics)
skewness(welfare$income, na.rm=T)

qplot(welfare$income) + xlim(0, 1000)

# 이상치 확인
summary(welfare$income)
prop.table(table(is.na(welfare$income)))
prop.table(table(welfare$income == 0))

# 이상치 결측 처리: 월급이 없는 사람은 평균에서 제외해보자.
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
sum(welfare$income == 9999, na.rm=T)


# 결측치 확인
table(is.na(welfare$income))

# 월급이 결측치인 사람들의 성별 비율을 계산해보자.
wf <- welfare %>% filter(is.na(income)) %>%
  group_by(sex) %>%
  summarise(n = n())

wf <- as.data.frame(wf)
wf$n <- wf$n / sum(wf$n)
wf

# 모든 데이터에 대한 성별비율은?
prop.table(table(welfare$sex))

## ---성별 월급 중간값 계산하기 ------------------------------- ##
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))

sex_income_med
sex_income

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()


#### 09-3 나이별 월급 ####

## -------"몇 살 때 월급을 가장 많이 받을까?"------- ##
head(welfare$birth)
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

# 이상치 확인
summary(welfare$birth)

# 결측치 확인
table(is.na(welfare$birth))

# 이상치 결측 처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))
## birth에는 결측치가 없다.

## ----------- 파생변수 만들기 - 나이 ----------------- ##
welfare$age <- 2015 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)

## --- 나이에 따른 월급 평균은? --------------- ##
age_income <- welfare %>% select(age, income) %>%
  filter(!is.na(income)) %>%
  group_by(age) %>%
  summarise(mean_income = mean(income))

head(age_income)

ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()

# Quiz: 경제인구의 실업율을 구해보자.
# [20, 60] 응답이 0, 9999나온 데이터의 비율.
# - raw_welfare$p1002_8aq1에서 결측치는 "none"
# - 0은 "no"
# - 나머지는 "yes"로 설정한 후,
# - 20살에서 60살까지의 연령대에 대해 이에 대한 빈도수를 계산해보자.



# Quiz: income의 결측치를 0으로 평가할 때, 
# 성별 income의 평균을 비교하라.



#### 09-4 연령대별 월급 차이 ####

## --------- "어떤 연령대의 월급이 가장 많을까?" ------- ##
welfare <- welfare %>%
  mutate(ageg = ifelse(age < 30, "young",
                       ifelse(age <= 59, "middle", "old")))

table(welfare$ageg)
qplot(welfare$ageg)


## ------- 1. 연령대별 월급 평균표 만들기 --------- ##
ageg_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg) %>%
  summarise(mean_income = mean(income))

ageg_income

ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col()


## -------- 막대 정렬 : 초년, 중년, 노년 나이 순 ---------- ##
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

# Quiz : 20대 30대 40대 50대 60대 이상으로 분류해보시오. 10대는 제거.



#### 09-5 연령대별 성별 평균 월급 표 ####
# ------- "성별 월급 차이는 연령대별로 다를까?" -----
# 먼저 위의 코드를 활용하여 직접 작성해봅시다.

age_sex_income <- welfare %>% filter(!is.na(income)) %>%
  group_by(age10, sex) %>%
  summarise(mean_income = mean(income))

ggplot(age_sex_income, aes(age10, mean_income,
                           fill=sex)) +
  geom_col()

## ----- 연령별 등급으로 다시 작성하면 ----------- ##
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))

sex_income

ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))

ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))


## Quiz: 나이 및 성별 월급 차이 분석하기 --------------- ##
# 나이 및 성별 월급 평균표를 작성하여 그래프로 표현해보자.
# - income의 비 결측치를 필터링
# - age, sex로 그룹
# - income에 대해 평균을 구하여 sex_age를 생성한다.
# - sex_age로 그래프를 그린다.



#### 09-6 직업별 월급 차이 ####

## -------- "어떤 직업이 월급을 가장 많이 받을까?" ---------- ##
class(welfare$code_job)
table(welfare$code_job, useNA="ifany")

### - 직업분류코드 목록 불러오기. 
library(readxl)
list_job <- read_excel("Data/Koweps_Codebook.xlsx", 
                       col_names = T, sheet = 2)
head(list_job)
dim(list_job)

## 결합
v1 = c(1, 2, 3); v2 = c(5, 4, 3)
cbind(v1, v2)
rbind(v1, v2)

## - welfare에 직업명 결합
welfare <- left_join(welfare, list_job, id = "code_job")
table(welfare$code_job, useNA="ifany")
table(is.na(welfare$code_job), useNA="ifany")
head(welfare)

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)


## ---------- job별 평균 임금을 계산하기 ------------- ##
job_income <- welfare %>%
  filter(!is.na(job) & !is.na(income)) %>%
  group_by(job) %>%
  summarise(mean_income = mean(income))

head(job_income)

top10 <- job_income %>%
  arrange(desc(mean_income)) %>%
  head(10)

top10

ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) +
  geom_col() +
  coord_flip()


# 하위 10위 추출
bottom10 <- job_income %>%
  arrange(mean_income) %>%
  head(10)

bottom10

# 그래프 만들기
ggplot(data = bottom10, aes(x = reorder(job, -mean_income), 
                            y = mean_income)) +
  geom_col() + 
  coord_flip() + 
  ylim(0, 850)


#### 09-7 성별 직업 빈도 ####

## -------- 성별로 어떤 직업이 가장 많을까? ------- ##
# 남성 직업 빈도 상위 10개 추출
job_male <- welfare %>%
  filter(!is.na(job) & sex == "male") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_male

# 여성 직업 빈도 상위 10개 추출
job_female <- welfare %>%
  filter(!is.na(job) & sex == "female") %>%
  group_by(job) %>%
  summarise(n = n()) %>%
  arrange(desc(n)) %>%
  head(10)

job_female

str(data)
# 남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()

# 여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x = reorder(job, n), y = n)) +
  geom_col() +
  coord_flip()


#---- Quiz: 연령 등급에서 노년층(ageg = old)을 제외하고 분석하면:
# 1. 노년층 제외 남성 직업 빈도 상위 10개 추출


# 2. 노년층 제외 여성 직업 빈도 상위 10개 추출


# 3. 노년층 제외 남성 직업 빈도 상위 10개 직업 그래프


# 4. 노년층 제외 여성 직업 빈도 상위 10개 직업 그래프 



# Quiz: 직업 빈도 상위 10개에 대한 남녀 비율



# Quiz : 월급 상위 30개 직업에 대한 남녀 비율\



#### 09-8 종교 유무에 따른 이혼율 ####

## -------- 종교가 있는 사람들이 이혼을 덜 할까? ------- ##
class(welfare$religion)
table(welfare$religion, useNA = 'ifany')

# 종교 유무 이름 부여
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
table(welfare$religion)
qplot(welfare$religion, geom = 'bar')
ggplot(welfare, aes(religion, fill=factor(religion))) + 
  geom_bar()


## ----- 혼인 상태 변수 검토 및 전처리 -------- ##
class(welfare$marriage)
table(welfare$marriage, useNA = "ifany")

# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))

table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)


## ------- 종교 유무에 따른 이혼율 분석 -------- ##
religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

religion_marriage

religion_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(religion, group_marriage) %>% 
  group_by(religion) %>% 
  mutate(pct = round(n/sum(n)*100, 1))

religion_marriage

# 이혼율 표 만들기
divorce <- religion_marriage %>%
  filter(group_marriage == "divorce") %>% 
  select(religion, pct)

divorce

ggplot(data = divorce, aes(x = religion, y = pct)) + geom_col()


## ---- 연령대 및 종교 유무에 따른 이혼율 분석 ---- ##
ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  group_by(age10, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

ageg_marriage

ageg_marriage <- welfare %>%
  filter(!is.na(group_marriage)) %>%
  count(age10, group_marriage) %>% 
  group_by(age10) %>% 
  mutate(pct = round(n/sum(n)*100, 1))

# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>% 
  filter(!(age10 %in% c(20, 30)) & group_marriage == "divorce") %>% 
  select(age10, pct)

ageg_divorce

# 그래프 만들기
ggplot(data = ageg_divorce, aes(x = age10, y = pct)) + geom_col()


## ------ 연령 대 및 종교 유무에 따른 이혼율 표 --------- ##
# 연령대, 종교유무, 결혼상태별 비율표 만들기
ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  group_by(ageg, religion, group_marriage) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>%
  mutate(pct = round(n/tot_group*100, 1))

ageg_religion_marriage

ageg_religion_marriage <- welfare %>%
  filter(!is.na(group_marriage) & ageg != "young") %>%
  count(ageg, religion, group_marriage) %>%
  group_by(ageg, religion) %>% 
  mutate(pct = round(n/sum(n)*100, 1))

# 연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%
  filter(group_marriage == "divorce") %>% 
  select(ageg, religion, pct)

df_divorce
relig_mark = factor(ifelse(df_divorce$religion==1,
                    "yes", "no"))

ggplot(data = df_divorce, aes(x = ageg, y = pct, 
                              fill = relig_mark)) +
  geom_col(position = "dodge")


#### 09-9 지역별 연령 비율 ####

## ------- 노년층이 많은 지역은 어디일까? -------- ##
class(welfare$code_region)
table(welfare$code_region)

# 지역 코드 목록 만들기
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region

# 지역명 변수 추가 
welfare <- left_join(welfare, list_region, id = "code_region")

welfare %>%
  select(code_region, region) %>%
  head


## ------ 지역 별 연령대 비율 분석 ---------- ##

region_ageg <- welfare %>%
  group_by(region, ageg) %>%
  summarise(n = n()) %>%
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 2))

head(region_ageg)

region_ageg <- welfare %>%
  count(region, ageg) %>%
  group_by(region) %>% 
  mutate(pct = round(n/sum(n)*100, 2))

ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +
  geom_col() +
  coord_flip()


## -------------- 막대 정렬하기 : 노년층 비율 높은 순 ------------------ ##
# 노년층 비율 내림차순 정렬
list_order_old <- region_ageg %>%
  filter(ageg == "old") %>%
  arrange(pct)

list_order_old

# 지역명 순서 변수 만들기
order <- list_order_old$region
order

ggplot(data = region_ageg, aes(x = region,  y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)

# 다르게 나타내면:
ggplot(data = list_order_old, aes(x = region,  y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order)


# ------- 연령대 순으로 막대 색깔 나열하기 -----------#
class(region_ageg$ageg)
levels(region_ageg$ageg)
region_ageg$ageg <- factor(region_ageg$ageg)
region_ageg$ageg <- factor(region_ageg$ageg,
                           level = c("old", "middle", "young"))
str(region_ageg$ageg)
levels(region_ageg$ageg)
table(region_ageg$ageg)

ggplot(data = list_order_old, aes(x = region,  y = pct, fill = ageg)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = order) 


# Quiz: 직업종별 지역분포를 작성해보자.
# - 각 직업코드의 첫 digit을 직업종으로 하자.
# - 1 ~ 10까지의 직업종에 대해 지역별 비율을 구한다.
# - 7대 지역을 x축으로 직업종의 비율을 y축으로 bar 챠트를 작성한다.
