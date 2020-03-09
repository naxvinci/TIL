
##2. R시작하기
##2.1 R설치
##http://www.r-project.org/ 에서 설치
v <- c(1,2,3)

##2.2 객체
## 생성된 객체 확인
objects()
ls()

##2.3 객체의 삭제
rm(v)
rm(list=ls()) #모든 객체의 삭제

##2.4 패키지
search()
as.environment(2)
library()

##2.5 도움말
help(function) #에러발생. 수학함수에 대한 도움말 검색을 원한다.
help.search("mathematical") #별로 그리 도움되지 않는다.
help.search("mathematics") #검색결과가 동일하다.
help.start() # 도움말 웹화면
help(seq) #seq함수에 대한 도움말
?seq #seq함수에 대한 도움말
RSiteSearch("lm") #help 매뉴얼 및 mailing lists 검색

##2.6 History 기능
history() # 최근 사용된 25개 명령어 목록
savehistory(file="myfile") #작업내역을 저장(".Rhistory"가 default)
loadhistory(fiel="myfile") #앞서 작업내역을 이용


##3. 데이터 타입
##3.1 변수
## 변수명: 알파벳(대소문자 구분), 숫자, _, .로 구성됨
## - 첫글자는 문자 또는 .로 시작하며, 뒤에 숫자가 올 수 없다.

## 변수에 값을 할당 <-, <<-, = 등을 사용하나, 일반적으로 <-을 사용


##3.2 스칼라
##R의 기본 데이터형은 벡터. 스칼라는 길이 1의 벡터
## 1) 숫자: 정수, 부동소수가 지원

sn1 <-3
sn2 <-4.5
sn3 <- sn1+sn2
print(sn3)

## 2) NA: 결측치를 의미
## 데이터에 값이 존재하지 않을 때 사용
sn4 <- NA
is.na(sn3)
is.na(sn4)

## 3) NULL: NULL 객체를 의미
## 변수가 초기화되지 않은 경우 사용하며 NA와 구분
s5 <- NULL
is.null(s5)
is.null(1)
is.null(NA)
is.na(NULL)

## 4) 문자열: 인용부호로 둘러쌓인 문자열
sc1 <- "hello"
print(sc1)

## 5) 진리값: TRUE, FALSE를 의미
## 진리값에는 &, |, ! 연산자를 사용할 수 있다.
## && ||은 한 개의 Boolean 값끼리의 연산에만 사용
## & |는 boolean이 저장된 벡터 끼리의 연산시 각 원소간 계산함
## TRUE, FALSE는 예약어고 T, F는 TRUE와 FALSE로 초기화된 전역변수
TRUE & TRUE
TRUE & FALSE
T & T
T & F
T | F
!T
T <- FALSE
print(T)
ls() ##R 작업공간(workspace)에 어떤 R 객체들이 있는지 확인함
rm(T) ## 지정된 인수의 객체를 작업공간에서 제거
print(T)

## 5) 요인(Factor): 범주형 변수를 위한 데이터 타입
## 성별에 대한 변수와 값을 지정
sex <- factor("m", c("m", "f"))
sex
class(sex)
str(sex)

## 성별 변수 sex의 값은 m이고, 가질 수 있는 수준은 m과 f 2개임
## c()는 벡터를 표현하는 방식
## 데이터에 순서가 없는 명목형 변수(Nominal)를 만든다.
nlevels(sex) ## 변수가 가질 수 있는 범주의 수
levels(sex)  ## 변수가 가질 수 있는 범주 값의 목록
levels(sex)[1]
levels(sex)[2]
levels(sex) <- c('male', 'female')
sex

## 순서(순위)가 있는 값을 만들 때 ordered() 또는 ordered=TRUE 지정
ordered(c('a', 'b', 'c'))
f <- factor(c('a', 'b', 'c'), ordered=TRUE) ## ordered=T
class(f)
str(f)
str(class(f))

#factor에 유용한 함수
ages<-c(24,26,34,43,57)
party<-c("새누리", "민주", "민주", "새누리", "기타")
tapply(ages, party, mean)
g<-c("M", "F", "M", "I", "M", "F", "I")
split(1:7, g)
#split(x, f)는 f의 그룹으로 x를 나눔
class(split(1:7, g)) # split함수의 결과는 list이다.


##3.3 벡터(Vector)
## 1) 정의: 배열의 개념 c()안에 원하는 인자를 나열하여 정의
vn1 <- c(1, 2, 3, 4, 5)
vn1
str(vn1)
class(vn1)
## 나열하는 인자들은 모두 같은 유형의 스칼라 타입이어야 함
## 다른 유형의 데이터가 섞여 있으면 하나의 데이터 타입으로 자동 형변환
vc1 <- c("1", 2, "3")
vc1
str(vc1)
class(vc1)
## 벡터는 중첩될 수 없다.
## 벡터 안에 벡터를 정의하면 단일 차원의 벡터로 변경된다.
## 중첩된 구조가 필요하면 list를 사용해야 한다.

c(1, 2, 3)
c(1, 2, 3, c(1, 2, 3))
## 숫자형 데이터는 start:end형태의 벡터를 생성할 수 있다.
## 또는 seq(from, to, by) 형태도 가능하다.
vn2 <- 1:10
vn2
vn3 <- 5:10
vn3
vn4 <- seq(1, 10, 2)
vn4

## seq_along()은 인자로 주어진 데이터의 길이만큼 1..N의 벡터를 반환
## seq_len()은 인자의 값만큼 1..N의 벡터를 반환

seq_along(c('a', 'b', 'c'))
vn5 <- seq_along(vn4)
vn5
seq_len(3)

## 벡터의 각 셀에 이름을 부여할 수 있음
vn6 <- c(1, 3, 4)
str(vn6)
names(vn6) <- c("kim", "seo", "park")
vn6
str(vn6)
class(vn6)
str(str(vn6))

vn7 <- 1:4
names(vn7)<-c("kim", "seok", "cho")
str(vn7)

## 2) 벡터 내 데이터 접근: 벡터명[index] (index는 1부터 시작)
vn6[1]
vn6[3]
## -index를 사용하면 특정 요소를 제외할 수 있다.
vn6[-1]
vn6[-2]
## 여러 위치의 요소를 가져오는 경우 벡터명[색인 벡터]를 사용
vn6[c(1,2)]
## 또는 x[start:end]형태로 요소를 가져올 수 있다. subsetting
vn6[1:2]
## 요소의 이름을 사용하여 접근할 수도 있다.
vn6["seo"]
vn6[c("seo", "park")]
## 요소의 이름만 보려고 하는 경우
names(vn6)[2]
names(vn6)[2:3]
## 벡터의 길이 확인: length(), NROW() cf: nrow()는 행렬의 행의 수를 반환
## 벡터는 1열의 행렬로 생각할 수 있다. NROW()는 벡터와 행렬 모두 사용
length(vn6)
NROW(vn6)
nrow(vn6)

## 3) 벡터 연산
## %in% 어떤 값이 벡터에 포함되어 있는지 여부
"a" %in% c("a", "b", "c")
1 %in% vn6
5 %in% vn6

## 벡터를 집합으로 고려해 집합간 연산(합,차,교집합)을 할 수 있다.
vc2 <- c("a", "b", "c")
vc3 <- c("a", "d")
setdiff(vc2, vc3)
union(vc2, vc3)
intersect(vc2, vc3)
## 집합간 비교는 setequal()을 사용한다.
setequal(vc2, vc3)
vc4 <- c("a", "b", "c", "c")
vc4
setequal(vc2, vc4)


## 벡터 관련 함수 ###
## 4) seq: 값의 나열
## seq(start, end<, increment>) 또는 start:end
seq(1, 5)
seq(1, 5, 2)
1:5

## 5) rep: 특정 값이 반복된 벡터를 만들 때 사용
rep(1:2, 5)
rep(1:2, each=5)
rep(1:2, times=2)
rep(1:3, 2:4)
rep(1:3, 2, each=3) #rep(1:3, times=2, each=3)과 가타.
rep(1:3, times=2, each=3, length.out=5)
rep(1:3, times=2, each=3, length.out=10)

## 6) scan(): 사용자에게 데이터를 입력받아 저장하는 함수
a<-scan() # 콘솔에서 데이터 입력후 엔터. 종료시 [ctrl+z]
a
b<-scan(what=numeric(0)) # 수치형 데이터만 입력받음
b

## recycling: 벡터의 차원이 다른 경우 길이를 맞춰주기
(a <- c(1,2))
(b <- 3:6)
a+b

## Filtering: 조건이 충족되는 항목만 추출
z <- c(5,3,-2)
z
w <- z[z>0]
w

##3.4 리스트: 해쉬 또는 딕셔너리에 해당하며,
## (키, 값) 형태의 데이터를 담는 연관 배열이다.

## 1) 정의: list(키=값, 키=값, ...)
l1<- list(name="foo", height=70)
l1
str(l1)
class(l1)

## 다양한 값을 혼합하여 저장할 수 있다. vector와 달리 리스트 중첩이 가능
(l2<-list(a=list(val=c(1, 2, 3)), b=c(1,2,3,4)))
str(l2)
class(l2)
str(l2[2])

## 2) list내의 데이터 접근
l3 <- list(name="foo", height=c(1,3,5))
l3$name
l3$height
l3[1]  # (키, 값)의 구조를 갖는 서브 리스트에 접근
l3[[1]]  # 서브 리스트의 값에 직접 접근
l3[2]
l3[[2]]
l3[[[2]]] 
l3[[2]][2]
str(l3[2])

## 3) 벡터를 통한 리스트의 합성
n=c(2,3,5)
s=c("aa", "bb", "cc", "dd", "ee")
b=c(T, F, T, F, F)
x=list(a=n,b=s,c=b,d=3)
x
x[2] # 한 개의 vector성분을 가지는 list
# list의 각 성분의 수가 동일하지 않아도 아무 문제없다.
x[[2]] # 벡터


##3.5 행렬: 벡터와 같이 한가지 유형의 스칼라만 저장한다.

## 1) 정의; matrix() 사용하여 정의한다.
matrix(c(1,2,3,4,5,6,7,8,9), nrow=3) ##default로 열부터 채움
matrix(seq(1, 9), nrow=3)
matrix(1:9, ncol=3)
matrix(1:9, nrow=3, byrow=T) ## 행부터 채움으로 변경

## 행과 열에 명칭을 부여
matrix(1:9, nrow=3, 
	dimnames=list(c("item1", "item2", "item3"),
			c("feature1", "feature2", "feature3")))

## 2) 행렬 내 데이터 접근
## 행렬의 각 요소는 행렬이름[행index, 열index]로 접근한다.
## 인덱스는 벡터와 마찬가지로 1부터 시작한다.
(x <- matrix(1:9, ncol=3))
x[1,1]
x[1,2]

## 벡터와 마찬가지로 특정 행 또는 열을 제외하거나
## 시작index:끝index로 특정 범위만 가져올 수 있다.
x[1:2, ]
x[-3, ]
x[c(1,3), c(1,2)]
## dimnames로 행과 열에 이름을 부여했다면, 이름을 사용할 수 있다.
m1 <- matrix(1:9, nrow=3, 
	dimnames=list(c("item1", "item2", "item3"),
			c("feature1", "feature2", "feature3")))
m1
m1["item1", ]
m1[1,2]
str(m1)
str(m1[1,])
str(m1[,1])

# 데이터 유형이 문자열인 행렬을 만들어 보자
mc1<-matrix(rep(c("a", "b", "c"), 3), ncol=3)
mc1
mc2<-matrix("a":"i", ncol=3) # 에러가 발생한다.


## 3) 행렬의 연산
## 행렬에 스칼라 곱 또는 나누기에 * /을 이용한다.
m1*2
m1/2
## 행렬간의 덧셈, 뻴셈은 + -을 이용한다.
m1+m1
m1-m1

## 행렬 곱은 %*%을 이용한다.
x %*% x

v1<-1:4
t(v1)%*%v1 #벡터의 내적이다.
v1%*%t(v1)

## 역행렬은 solve(행렬)로 계산한다.
solve(x) #MASS 패키지의 ginv()를 사용할 수도 있다.
y <- matrix(1:4, ncol=2)
solve(y)
y %*% solve(y) %*% c(1,2)

## 전치행렬은 t()로 구한다.
t(x)
x %*% t(x)
# - 공분산을 구하는데, 전치행렬을 사용할 수 있다.
X <- sample(1:10, 15, T)

mX <- matrix(X, nrow=5)
mX
N = nrow(mX)
meanedmX <- apply(mX, 2, mean)

for(i in 1:N){
  scaledmX[i, ] = mX[i, ] - meanedmX
}

apply(scaledmX, 2, mean)
t(scaledmX) %*% scaledmX / (N-1)

cov(mX)

## 행렬의 차원은 ncol(), nrow(), attributes()로 알 수 있다.
ncol(mX)
nrow(mX)
attributes(mX)
length(mX) #결과는 ncol(x)*nrow(x) 이다.
dim(mX)

## 3.6 배열(array): n차원 행렬, 반면 matrix는 2차원이다.
## 1) 정의
matrix(1:12, ncol=4)
(a1<-array(1:12, dim=c(3, 4)))
str(a1)
class(a1)
(a3<-array(1:12, dim=c(2,2,3)))
str(a3)
class(a3)

array(1:12, dim=c(2,2,3), byrow=T) #[q]행부터 입력이 되게하려면?
help(array)
??array #답 찾기 힘듦
z=t(array(1:12, dim=c(2,2,3))) #전치는 행렬에만 사용할 수 있음

## 2) 배열 내의 데이터 접근
a3[1,2,3]
a3[1,2,]
dim(a3)

## 3) 배열의 데이터 입력 방식
array(1:12, dim=c(4,3))
array(1:72, dim=c(4,3,2,3))
# dim=c(a, b, c, d)라면, axb매트릭스를 성분으로하는 cxd 매트릭스를 생성
# 이때, 1:72가 입력되는 방식은 항상, 열부터 먼저 입력된다.

x<-array(1:36, c(4,3,3))
x
x[1,,] #array, matrix에서 선택된 것은 항상 벡터로만 취해진다.
# 전치되지 않은 변수의 위치를 유지하여 구하려면
t(x[1,,])
x[,,1] # 원하는 결과와 동일한 결과임


##3.7 데이터 프레임: R에서 가장 중요한 자료형
## 행렬과 비슷한 모습이지만, 다양한 변수, 관측치, 범주 등을 표현
## 1) 정의: data.frame()으로 정의한다.
d <- data.frame(x=1:5, y=seq(2, 10, 2))
d #print(d)와 같은 결과
print(d)
## 데이터형이 다른 요인을 추가할 수도 있다.
d <- data.frame(x=1:5, y=seq(2, 10, 2), z=c('M', 'F', 'M', 'F', 'M'))
d
str(d)
class(d)
## [q]z이 왜 요인이지? factor()를 사용하지 않았는데.....

## 기 정의된 data frame에 새 열을 추가할 경우
## ==> $열이름<- ... 와 같은 방법으로 추가한다.
d$v <- seq(3, 15, 3)
d

mydata <- data.frame(age=numeric(0), gender=character(0), 
	weight=numeric(0))
mydata <- edit(mydata) # 직접 데이터 입력하기

## 2) 데이터 프레임의 접근
## 각 열은 $변수명 또는 행이나 열의 인덱스로 접근한다.
d$x 
d[1,]
d[2,3]
## 벡터로 인덱스를 지정하거나, 제외하는 열을 -로 표현할 수도 있다.
d[c(1,3), 2]
d[-1, -c(2,3)]
## 컬럼명을 지정할 수도 있다.
d[, c("y", "z")]
d[1:2] # 첫번째와 두번째 컬럼만 가져온다.

d[, "x"]
d[, c("x")] #하나의 열만 선택된 경우는 벡터로 반환한다.
## 벡터로 반환되는 것을 피하려면, drop=F옵션을 지정한다.
d[, "x", drop=F]

## str()과 head()함수
## str함수는 R객체의 내부구조를 보는데 사용
str(d)

## 통상 R에서의 처리를 데이터 프레임을 기본 타입으로 진행
## 데이터 프레임에 많은 양의 데이터가 저장된다.
## 데이터의 앞부분만 보기위한 함수가 head()
e <- data.frame(x=1:1000)
e
head(e)

## 데이터프레임의 열과 행에 이름을 부여: colnames(), rownames()
e <- data.frame(1:3)
e
colnames(e) <- c('val')  #names를 사용해도 colnames()와 같다.
e
rownames(e) <- c('a', 'b', 'c')
e

## 주어진 값이 벡터 존재하는 지 판별하는 %in%연산자 이용 열 선택
e <- data.frame(a=1:3, b=4:6, c=7:9)
(e <- data.frame(a=1:3, b=4:6, c=7:9)) #프레임생성과 함께 출력
e[, names(e) %in% c("b", "c")]

## 특정 값들을 제외해서 열을 선택
e[, !names(e) %in% c("a")]
e[, !names(e) %in% "a"]


## 3) 축약표시 - attach 또는 transform의 사용
ArthritisTest <- Arthritis
attach(ArthritisTest)
AgeBand <- floor(Age/10) #변수 생성시 data.frame을 지정하지 않은 경우
#ArthritisTest$AgeBand <- floor(Age/10)
detach(ArthritisTest)
ArthritisTest
Ageband # 단지 벡터가 생성될 뿐이다.
rm(AgeBand)

ArthritisTest <- transform(ArthritisTest,
	AgeBand1 = floor(Age/10))
ArthritisTest


## 4) 파일을 불러들여 읽기
## - file(), url()
## - 패키지의 이용: Excel, DB, XML, SPSS, SAS 등: 검색해서 알아보기
## - csv 파일 읽기
mydata <- read.table("c:/a.csv", header=T, sep=",", row.names="id")
mydata

## - 데이터 내보기기
write.table(mydata, "c:/mydata.txt", sep="\t")
## - 다시 가져오기
mydata1 <- read.table("c:/mydata.txt", header=T, sep="\t", row.names="id")
#row.names가 없어야 함
mydata1 <- read.table("c:/mydata.txt", header=T, sep="\t")
mydata

## - 데이터프레임의 merge - RDBMS의 join과 유사
#merge two data frames by ID
total <- merge(dataframeA, dataframeB, by="ID")
?merge

##3.8 타입 판별
##반환된 결과의 타입을 확인할 때 class()를 사용
class(c(1,2)) #vector는 numeric으로 반환됨
class(d)
class(m1)
class(a3)
class(l1)
class(vc1) #vector는 character로 반환됨
class(f)
## 벡터는 요소의 data type에 따라, numeric, character, logical, factor

## 타입은 str()함수로도 확인할 수 있다.
str(c(1,2)) #vector는 num으로 표현되며, 값이 나열됨
str(d) #data frame이 data.frame으로 표현됨
str(a3) #배열이 int로 표현되며, 값이 나열됨
str(m1) #matrix가 int로 표현되며, 값이 나열됨
str(l1)  #list가 list로 표현되며 값이 나열됨
str(vc1) #vector는 chr로 표현되며, 값이 나열됨
str(f) #factor가 ord.factor로 표현되며, 레벨과 순서, 값이 나열됨

rm(ed)
ed <- class(e)
class(ed)  #character
str(ed) #chr "data.frame"
## class()의 반환 type은 character이며, 그 값은 data type이다.

rm(ed)
ed <- str(f)
class(ed) #NULL이 된다.
str(ed) #NULL
## str()의 반환값은 없다.

## is.factor, is.numeric (숫자벡터), is.character(문자열벡터)
## is.matrix, is.data.frame 등으로 data type을 확인할 수 있다.

is.numeric(c(1,2,3))
is.numeric(c('a','b','c'))
is.matrix(y)


##3.9 타입 변환
##각 타입변환할 데이터를 인자로 넘기거나
## as.*() 종류의 함수를 사용하여 수행한다.
x <- data.frame(matrix(c(1,2,3,4), ncol=2))
x
colnames(x) <- c("X", "Y")
x

data.frame(list(x=c(1,2), y=c(3,4)))

x <- c("m", "f")
x
as.factor(x)
x
as.numeric(x)
as.numeric(as.factor(x))
## 알파벳 순서상 f가 m보다 빠르므로 그 결과 
## m->2, f->1로 변환이 이뤄짐

## 레벨의 순서를 강제로 바꾸기
factor(c("m", "f"), levels=c("m", "f"))
## as.factor()는 levels 옵션이 없으므로, factor()에서 지정해야 함



## 4. 제어문, 연산, 함수
## R은 제어문, 연산, 함수가 벡터연산을 통해 한번에 데이터를 처리
## 한번에 처리하는 데 있어 결측치 처리가 중요하다.

## 4.1 IF, FOR, WIHITE문
## IF문의 구조: 다른 언어와 별 차이 없다.
if(T) {
	print('TRUE')
	print('hello')
} else {
	print('FALSE')
	print('world')
}
## FOR문의 구조: 다른 언어와 별 차이 없다.
for(i in 1:10){
	print(i)
}
## WHILE문의 구조: 다른 언어와 별 차이 없다.
i <- 0
while(i<10){
	print(i)
	i <- i+1
}


##4.2 행렬 연산: 생략
## + - %*% t() solve()


##4.3 NA의 처리
## 결측치(NA)가 연산에 포함되면 연산결과는 NA가 됨
NA & TRUE
NA + 1

## 결측치 제거를 위해 많은 R함수들은 na.rm 인자를 받는다.
## na.rm은 NA값이 있을 때 제거할 것을 지정하는 것이다.
sum(c(1,2,3,NA))
sum(c(1,2,3,NA), na.rm=T)

## 머신러닝 패키지 caret에서는 na.omit, na.pass, na.fail 등을
## na.action 이라는 인자로 받아 NA처리를 결정한다.
## <참고> http://cran.r-project.org/web/packages/caret/index.html
x <- data.frame(a=1:3, b=c('a',NA,'c'), c=c('A', 'B', NA))
x
na.omit(x)
na.pass(x)
na.fail(x)
## na.omit()은 NA가 포함된 행을 제외
## na.pass()는 NA 여부를 상고나하지 않고
## na.fail()은 데이터에 NA가 있으면 에러를 내보낸다.
## 따라서, NA에 대한 처리를 na.action으로 받으면
## na.action(data.frame)을 실행하여 처리중인 데이터를 원하는대로 조작함


##4.4 함수의 정의
##함수명 <- function(인자, 인자,...){본문}으로 정의

## 피보나치 함수의 구현 예
fibo <- function(n){
	if(n==1||n==2){
		return(1)
	}
	return(fibo(n-1)+fibo(n-2))
}
fibo(1)
fibo(6)
## 반환값은 return(반환값)을 사용한다.
## return()이 생략되면, 함수 내 마지막 문장의 반환값이 함수의 반환값
fibo <- function(n){
	if(n==1||n==2){
		1
	} else {
		fibo(n-1)+fibo(n-2)
	}
}

## 함수에 인자의 값을 넘겨줄 때, 위치에 의한/ 이름에 의한 방법이 가능
f <- function(x, y){
	print(x)
	print(y)
}
f(1,2)
f(y=1,x=3)

## R함수의 도움말을 보면, '...'를 인자목록에서 볼 수 있다.
## 인자에서의 ...는 임의의 인자를 받아서 다른 함수에 인자로 넘기는 용도
g <- function(z, ...){
	print(z)
	f(...)
}
g(1,2,3)
g(1,2,3,4) ##에러가 날까? 결과는 어떻게 될까?

##nested 함수를 사용할 수 있다.
f1 <- function(x, y){
	print(x)
	g <- function(y){
		print(y)
	}
	g(y)
}
f1(1,2)

##여기서 함수g는 local 함수로 global함수 g와는 다르다.
g(3,4,6)

print(f1(1,2)) #반환값에 문제가 있음
vf1<-f1(1,2)
vf1

f2 <- function(x, y){
	print(x)
	g <- function(y){
		print(y)
	}
	g(y)
	return(c(x, y))
}
f2(1,2)
vf2 <- f2(1,2)
vf2

## 4.5 스코프(scope): 변수의 사용범위를 지정
## R에서는 보통 static(lexical) scope를 사용
## 따라서, 콘솔에서 선언한 변수는 어디서든 사용 가능함.
n <-1
f3 <- function(){
	print(n)
	n <<- n + 3
}
f3()
n

## 함수 내부에서 정의된 변수의 범위는 함수 내부다.
## 함수에서 참조한 변수는 내부에서 정의된 변수를 우선 참조한다.
## 함수 내부에서 정의된 local 변수는 외부에서 참조할 수 없다.

list
ls()
rm(list=ls()) # 모든 객체(변수, 함수)를 삭제하는 명령
ls()

f <- function(){
	print(x)
}
f() #에러가 발생한다.

f <- function(){
	x <- 1
	print(x)
}
f()
x

n <- 100
f <- function(n){
	print(n)
}
f(1)
f()

## 중첩함수에서의 인수(예: a)를 찾는 순서: 중첩함수 내>모함수>전역변수
a <-100
f <- function(x){
	a <- 2
	g <- function(y){
		print(y+a)
	}
	g(x)
}
f(1)

f <- function(x){
	g <- function(y){
		print(y+a)
	}
	g(x)
}
f(1)

## nested 함수에서 변수의 접근
f <- function(){
	a <-1
	g <- function(){
		a <-2
		print(a)
	}
	g()
	print(a)
}
f()
## 원래 의도가 nested 함수 g에서 f에서 선언된 a에 접근하려던 것이라면
## g()에서 local 변수를 새로 생성하는 <-가 아닌 <<-를 사용해야 한다.
## 이를 변수에 대한 참조(Reference)에 의한 전달이라 한다.
b <- 0
f <- function(){
	a <- 1
	g <- function(){
		a <<- 2
		b <<- 4
		print(a)
		print(b)
	}
	g()
	print(a)
	print(b)
}
f()
b #함수에 의해 전역변수 b의 값이 변한다.

## 위치에 의한 값의 전달
b <- 0
f <- function(){
	a <- 1
	g <- function(x, y){
		x = x+2
		y <<- 4 #b의 값이 변화되지는 않는다.
		print(x)
		print(y)
		y = y+5
		print(y)
	}
	g(a, b)#b의 값이 복사하여 전달됨
	print(a)
	print(b)
}
f()
## 값은 전달되지만, 이를 수정할 수는 없다.


##4.6 벡터 연산: 벡터 또는 리스트를 한번에 연산
x <- 1:5
x+1

x <- 1:5
x+x
abs(x)

x == x
(x2<- x %% 2)


c(T,T,T)&c(T,F,T)
sum(x)
mean(x)
median(x)

ifelse(x %% 2==0, "even", "odd")
## vectorized 조건문: ifelse(조건문, a, b) 함수
## 조건이 참이면 a, 거짓이면 b로 벡터의 각 요소에 대해 평가함
## 이때, 조건문과 a, b는 각각 벡터가 될 수 있다.


(d <- data.frame(x=1:5, y=c("a", "b", "c", "d"))) #오류 발생. 열 길이가 틀림.
(d <- data.frame(x=1:5, y=c("a", "b", "c", "d", "e")))
d[c(T, F, T, F, T), ]
## 데이터 프레임에 TRUE, FALSE를 지정해 특정 행만을 가져옴

d[d$x %% 2 == 0,]
## x열의 값 중 2로 나누어 떨어지는 행의 data만 가져옴


##4.7 값에 의한 전달
##R에서는 모든 것이 객체다. 
##객체는 함수 호출시 일반적으로 값으로 전달된다.
##이를 값에 의한 전달(pass by value)이라 하며, 
##객체가 복사되어 함수로 전달된다는 의미이다.
##<참고> 모든 객체가 다 값에 의해 전달되지 않는다.
## --> http://homepage.stat.uiowa.edu/~luke/R/references.html
df3
f <- function(df2){
	df2$a <- c(1,2,3)
  # df2$a <<- c(1,2,3) #에러가 발생한다. 객체 df2를 찾을 수 없다.
## <<-을 사용하려면, 외부변수에 대한 참조에 의한 전달을 해야한다.
}
str(f)
df <- data.frame(a=4:6)
class(df)
f(df)
df  #값에 의한 복사이므로 df는 변경되지 않는다.


f2<-function(){
	df3<<-data.frame(a=8:10)
	df$a<<-1:3
}
df3 #존재하지 않아 에러
df # 아직변경되지 않음

## 함수f의 처리 결과를 전달하면..
f2()
#df <- f2()
df #참조에 의한 전달에서 df의 열이 변경됨
class(df) 
str(df) #data.frame이 numeric 벡터로 변경되었다.
df3 #참조에 의한 전달에서 df3가 전역변수로 생성됨


## 형변환을 방지하고,
## 인자로 받은 df를 수정하려면 함수f에서 return을 해주어야 한다.
df2
f3 <- function(df2){
	df2$m <- c(1,2,3)
	return(df2)
}
df <- data.frame(a=4:6)
class(df)
df
df <-f3(df)
class(df)
df
## 보통 직접적인 대입<-이 아니고선 
## 객체의 상태는 함수에 의해 직접 수정되지 않는다.(보호된다.)
## 함수의 참조에 의한 전달에서 <<- 연산자 사용시 변경된다.
## 추가적인 내용은 http://vita.had.co.nz/papers/mutatr.pdf 참고

## <참고> 프레임의 열의 이름까지 지정하여 전달할 수 있을까?
df5
f4 <- function(df4, k){
	m<-k
	print(class(m))
	df4$ooo <- c(1,2,3)
	colnames(df4$ooo) <- m
	return(df4)
}
df5 <- data.frame(a=4:6)
class(df5)
df5

l<-"abc"
df5 <-f4(df5, l)
class(df5)
df5 # 에러가 나서 변경이 되지 않는다.


##4.8 객체의 불변성
##전술하였듯이 R의 객체는 거의 대부분 불변이다.(immutable)

a <- list()
a$b <- c(1,2,3) #원래 객체인 a를 수정한 것으로 보인다.

##실제로는 
## 1) a를 복사하여 새 객체 a'을 만들고 
## 2) a'에 필드 b를 추가하고
## 3) 필드 b에 c(1,23)을 채워 넣은 다음
## 4) 변수명 a가 a'을 가르키도록 하며, 이전 객체 a는 버려진다.
## 이 때문에 for문을 통해 벡터의 요소를 수정하는 것은 비효율적이다.
v <- 1:1000
for (i in 1:1000){
	v[i] <- v[i]+1
} #개나 되는 벡터 객체를 생성하므로 메모리 비효율적이다.
v <- v+1이 훨씬 효율적이다.

## 참고
a$c <<- c(4,5,6) # <<-는 함수 내에서만 사용가능하다.

rm(list=ls()) #모든 객체를 지운다.
gc() #현재 사용하지 않는 변수들을 메모리에서 삭제
##v <- 1:9999999
##for (i in 1:9999999){
##	for (j in 1:9999999){
##		v[j] <- v[j]+1
##	}
##}
##rm(list=ls())
##gc()
## 위 코드를 실행하고 작업관리자를 보면, 메모리 사용량이 점점 증가함
## 위 코드를 실행하지 마시오.


##4.9 모듈 패턴
##모듈은 외부에서 접근할 수 없는 데이터와 이를 제어하는 함수의 구조물
##패턴은 정형화된 코딩 기법
##모듈의 사용자에게 데이터 내부 구조를 모르게하며, 사용이 간편해짐

## 1) 큐
## 큐를 모듈로 작성해 보자. 큐는 FIFO 메모리 구조
q <- c() #q라는 큐 컨테이너를 정의
q_size <- 0 #큐에 저장된 data의 수
enqueue <- function(data) { #q에 데이터를넣기
	q <<- c(q, data)
	q_size <<- q_size + 1
}
dequeue <- function(){ #큐에서 데이터를 빼내어 반환.
	first <- q[1]
	q <<- q[-1]
	q_size <<- q_size - 1
	return(first)
}
size <- function(){
	return(q_size)
}

## 큐의 사용
enqueue(1)
enqueue(3)
enqueue(5)
print(size())
print(dequeue())
print(dequeue())
print(dequeue())
print(size())
print(q_size)
str(q)

## 2) 큐 모듈의 작성
## 앞에서 작성한 큐는 전역으로 선언되어 있어, 
## enqueue()나 dequeue()를 거치지 않고도 q를 변경시킬 수 있다.
enqueue(1)
q <- c(q, 5) 
print(size())
dequeue()
dequeue()
size()
##외부에서 q에 직접 할당하여 q size가 올바르지 못함

##q의 모듈화 정의 => queue()는 q라는 객체의 생성자 함수 역할.
queue <- function(){
	q <- c()
	q_size <- 0

	enqueue <- function(data){
		q <<- c(q, data)
		q_size <<- q_size + 1
	}

	dequeue <- function(){
		first <- q[1]
		q <<- q[-1]
		q_size <<- q_size - 1
		return(first)
	}

	size <- function(){
		return(q_size)
	}

	return(list(enqueue=enqueue, dequeue=dequeue, size=size))
}
##q와 q_size가 지역변수이므로 외부에서 접근이 불가능
##함수 enqueue(), dequeue(), size()는 함수queue의 반환값으로 제공됨

##queue()의 사용
q <- queue()
q$enqueue(1)
q$enqueue(3)
q$size()
class(q)
str(q)

q$dequeue()
q$dequeue()
q$size()

##모듈 패턴에 대해 아래 참고
##http://www.adequatelygood.com/JavaScript-Module-Pattern-In-Depth.html


## 4.10 객체의 삭제
## 메모리상의 객체의 목록을 얻는 함수 ls()
## 특정 객체를 삭제하는 함수는 rm()
##따라서 rm(list=ls()) 모든 객체를 삭제한다.
##그러나 rm(list<-ls())는 에러가 발생한다. [q]why?
x <- 1:5
rm("x")
rm(x)
x # 에러가 발생한다. 위 모두 사용가능하다.


##5.데이터 조작1
##벡터기반 데이터 처리는 데이터 조작을 더 빠르게 해주며 병렬화가 가능
##따라서 일반 범용 언어에 비해서는 데이터 조작이 빠르나,
##대용량 데이터에 대해서는 MySQL 등의 DBMS에 비해 느리므로
##DBMS로 부터 데이터를 csv등으로 받거나, 직접 연동하는 것이 좋다.


##5.1 iris데이터: 기본적으로 R에 포함되어 있다.
##3종의 붓꽃(setosa, versicolor, virginica)의
##꽃받침(sepal), 꽃잎(petal)의 길이와 폭에 대한 50x3종의 데이터이다.

head(iris)
## Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, Species
str(iris) #??

##iris3 데이터셋은?
head(iris3)
str(iris3)
class(iris3)
iris3

##iris3를 iris로 iris를 iris3로 바꾸어보는 것은 어떨까?

##R에 저장된 data set의 목록보기: 'library(help=datasets)'
library(help=datasets)
##dataset의 사용: data(데이터셋이름)

data(mtcars)
head(mtcars)
?mtcars #또는 help(mtcars)을 사용하여 mtcars 데이터셋의 상세내용 보기
rm(list=ls())


##5.2 파일 입출력
## 1) csv파일 입출력
## csv파일을 읽기위해서는 read.csv(파일명, header=boolean)
## default는 header=T이므로, 헤더가 없다면 반듯이 header=F로 설정
## 이하, 헤더/factor/결측치 처리, 공백에 의한 type 변형 등을 확인해 보자.
x <- read.csv("c:\\c.csv")
str(x)

x <- read.csv("c:\\c.csv", header=T)
x$name = as.character(x$name)
str(x)

x <- read.csv("c:\\c.csv", header=T, stringsAsFactor=F)
str(x)

y <- read.csv("c:\\b.csv", header=F, stringsAsFactor=F)
str(y)
names(y) <- c("id", "name", "score")
str(y)

z <- read.csv("c:\\a.csv", header=T, stringsAsFactor=F)
str(z)
z <- read.csv("c:\\a.csv", stringsAsFactor=F, na.strings=c("NIL"))
str(z)
##score가 chr로 표시되는 문제가 있다. 공백을 없애면....

z <- read.csv("c:\\a1.csv", header=T, stringsAsFactor=F)
str(z)
z <- read.csv("c:\\a1.csv", stringsAsFactor=F, na.strings=c("NIL"))
str(z)
z <- read.csv("c:\\a1.csv", stringsAsFactor=F, na.strings="NIL")
str(z)

##결측치를 확인해 보자
is.na(z$score)
is.na(z[,3])
is.na(z)

## data.frame을 파일로 저장해 보자.
write.csv(x, "c:\\c2.csv", row.names=F) #행번호를 빼고 저장
write.csv(z, "c:\\a2.csv", row.names=F)
## 차이점을 원본 및 data frame과 비교해 보자.


##5.3 save(), load()
##R객체를 파일로 저장
x <- 1:5
y <- 6:10
save(x, y, file="c:\\xy.RData")

##파일로 부터 데이터를 불러오기: load()
rm(list=ls())
load("c:\\xy.RData")
x
y


##5.4 rbind(), cbind()
##행 또는 열 형태의 데이터를 합쳐 행렬 또는 데이터 프레임을 만든다.
rbind(1:3, 4:6) #각 벡터를 행으로 하여 행렬 만들기
cbind(1:3, 4:6) #각 벡터를 열로 하여 행렬 만들기

x <- data.frame(id=1:2, name=c("a", "b"), stringsAsFactors=F)
x
str(x)
y <- rbind(x, c(3, "c"))
y
z <- cbind(x, greek=c('alpha', 'beta'))
z
str(z)
z <- cbind(x, greek=c('alpha', 'beta'), stringsAsFactors=F)
z
str(z)

## 기존의 데이터 프레임에 새로운 열을 병합하는 경우
x$greek <- c('alpha', 'beta')
x


##5.5 Xapply 함수들: 벡터 또는 행렬에 임의의 함수를 적용한 결과 얻기
## 벡터, 행렬, 리스트, 데이터 프레임에 적용할 함수를 명시

## 1) apply(): 행렬의 열 또는 행 방으로 특정 함수 적용시 사용
## 사용방법: apply(행렬, 방향, 함수[,함수인수]) 방향이 1이면 행, 2이면 열
## 수행 결과값은 벡터, 배열, 리스트 중에 적합한 것으로 반환됨
d <- matrix(1:9, ncol=3)
apply(d, 1, sum) #행 방향의 합의 반환값은 열 벡터
apply(d, 2, sum) #열 방향의 합의 반환값은 행 벡터

u <- apply(d, 1, sum)
str(u) #벡터
v <- apply(d, 2, sum)
str(v) #벡터

head(iris)

iris.frame <- iris
iris.frame$sum <- apply(iris[, 1:4], 1, sum)
iris.frame
iris.frame <- rbind(iris.frame, apply(iris.frame[, -5], 2, sum)) #에러.

## 이러한 계산을 위한 rowSums(), colSums()이 정의되어 있다.
colSums(iris[, 1:4])
colMeans(iris[, 1:4])
rowSums(iris[, 1:4])

m <- matrix(1:10, nrow=5)
m
apply(m, 1:2, function(x) return(x/2)) #행렬을 리턴할 수도 있다.
apply(m, 1:2, function(x) x/2) #결과가 같다. 
apply(m, (1,2), function(x) x/2) #에러가 난다. 
apply(m, c(1,2), function(x) x/2) #결과가 같다. 

mydata<-matrix(rnorm(30), ncol=5)
mydata
apply(mydata, 2, mean, trim=0.1)#상하위10%를 제외한 평균 구하기

## 2) lapply(X, 함수): X는 벡터 또는 리스트, 함수는 X내의 각 요소에 적용
## (연산은 보통 행으로 이뤄지며,) 결과는 리스트로 반환된다.
## <참고> 리스트의 요소는 리스트[[n]]으로 접근할 수 있다.
result <- lapply(1:3, function(x) {x*2})
result
str(result)
result[[2]]

##결과인 리스트를 벡터로 변환하기
res <- unlist(result)
res
res2 <- unlist(lapply(1:3, function(x) {
	x*2
}))
res2

x <- list(a=1:3, b=4:6)
x
str(x) #[q]result는 요소 값은 num인데, x의 요소 값은 int이다. why?
lapply(x, mean)

##데이터 프레임에 lapply() 적용하기
lapply(iris[, 1:4], mean) #각 열에 대한 평균을 구한다. list로 반환된다.
colMeans(iris[, 1:4])
Miris <- colMeans(iris[, 1:4])
str(Miris) #벡터
v1 <- data.frame(1:4, Miris)
str(v1)

##data frame의 처리결과를 data frame으로 변경하기
##1) unlist()로 벡터로 변환한다.
##2) matrix()를 사용해 벡터를 행렬로 변환한다.
##3) as.data.frame()으로 행렬을 데이터 프레임으로 변환한다.
        ## 유사하게, as.vector(), as.list(), as.factor() 등이 있다.
##4) names()로 리스트로 부터 변수명을 얻어 이름을 부여한다.
d <- as.data.frame(matrix(unlist(lapply(iris[, 1:4], mean)), 
	ncol=4, byrow=T))
names(d) <- names(iris[, 1:4])
d #data frame이다.
(d1<- colMeans(iris[, 1:4])) #vector이다.
str(d)
str(d1)

d2 <- data.frame(colMeans(iris[, 1:4]), ncol=4) #변환이 잘 않됨
names(d2) <- names(iris[, 1:4])
str(d2)

d3 <- data.frame(t(colMeans(iris[, 1:4]))) #전치를 하면 잘 됨(why?)
names(d3) <- names(iris[, 1:4])
str(d3)
d3

##do.call()사용: do.call(호출함수, 리스트)
data.frame(do.call(cbind, lapply(iris[, 1:4], mean))) #와! 끝내준다.

##unlist()를 사용하는 경우, data type이 다른 경우는 문제를 발생시킴
x <- list(data.frame(name="foo", value=1),
	data.frame(name="bar", value=2))
unlist(x) #모두 엉뚱한 값으로 저장되어 버린다. ㅠ.ㅠ.....
## 따라서, data type이 혼합된 경우는 무조건 do.call을 사용한다.

## rbind를 사용하는 경우
x <- list(data.frame(name="foo", value=1),
	data.frame(name="bar", value=2))
do.call(rbind, x) #속도가 느리다는 단점이 있다.
## data의 양이 많으면 rbindlist를 사용해야 한다.


## 3) sapply(): lapply()와 유사하지만, 행렬, 벡터 등으로 결과를 반환
## 입력으로는 벡터, 리스트, 데이터 프레임 등이 사용된다.

## iris 데이터셋에 대한 열별 평균을 구하기 위해 lapply()와 sapply()를 사용
## lappy()의 결과는 리스트이지만, sapply()의 결과는 벡터이다.
(lapp <- lapply(iris[, 1:4], mean))
str(lapp)
(sapp <- sapply(iris[, 1:4], mean))
str(sapp)
## sapply()의 결과를 바로 data.frame으로 변환하자.
as.data.frame(sapp)
as.data.frame(t(sapp))

## data set의 각 열에 저장된 data의 클래스를 확인해보자.
sapply(iris, class)

## iris의 숫자형 data가 3보다 큰지 확인하는 행렬의 생성
y <- sapply(iris[, 1:4], function(x) {x>3})
class(y)
head(y)
##sapply()는 하나의 data type으로만 저장가능한 벡터, 행렬, 배열을 반환
##반환결과가 여러 data type으로 예상된다면, lappy()나 plyr 패키지를 사용.

x<- 1:4
ans_sqd <- function(z) return(c(z, z^2))
sapply(x, ans_sqd) # 결과가 열이 아닌 행의 기준으로 배열된다. 좀 고민해야 함


##4) tappy(): 그룹별 처리를 위한 apply함수. tapply(데이터, 색인, 함수) 사용
##색인은 데이터가 어느 그룹에 속할지를 결정하는 factor형 데이터
##데이터가 주어졌을 때, 속한 그룹에 따라 주어진 함수를 수행한다.
??tappy

tapply(1:10, rep(1, 10), sum) #반환값은 배열이다.
## 1부터 10까지의 수가 모두 하나의 그룹에 있을 때, 합을 구하기
## rep(1, 10)의미는 1을 10회 반복한다는 의미
## 따라서, 1:10의 수는 모두 1이라는 그룹에 모두 속한다는 의미
## 그러므로 1의 그룹에 속한 데이터의 합은 55이다.

## 1에서 10까지 홀수별, 짝수별 합을 구해봐.
tapply(1:10, 1:10 %% 2 == 1, sum)
class(tapply(1:10, 1:10 %% 2 == 1, sum))
str(tapply(1:10, 1:10 %% 2 == 1, sum))
## 여기서 %%는 나머지를 구하는 연산자임

##iris 데이터에서 species별 Sepal.Length의 평균을 구해보자.
tapply(iris$Sepal.Length, iris$Species, mean)
class(tapply(iris$Sepal.Length, iris$Species, mean)) #배열이네.
v3 <- as.vector(tapply(iris$Sepal.Length, iris$Species, mean)) 
v3

## 복잡한 그룹화 방법을 보자
m <- matrix(1:8, ncol=2,
	dimnames=list(c("spring", "summer", "fall", "winter"),
		c("male", "female")))
m
mName <- matrix(1:8, ncol=2,
	dimnames=list(season=c("spring", "summer", "fall", "winter"),
		sex=c("male", "female")))
mName
str(mName)
m$spring #[q]에러가 난다. 행렬은 행렬$.. 식의 접근이 않된다.
m["spring", ]
mName["spring",]

##반기별 남성 셀의 합과 여성 셀의 합을 구해보자.
tapply(m, list(c(1,1,2,2,1,1,2,2), c(1,1,1,1,2,2,2,2)), sum) #존나 어려워~
class(tapply(m, list(c(1,1,2,2,1,1,2,2), c(1,1,1,1,2,2,2,2)), sum))
## 왜 matrix일까?
##[alarm]그림을 그려서 봐야한다.

##리스트의 첫 벡터는 상반기, 하반기를 구분
##리스트의 둘째 벡터는 남, 여를 구분
##그룹을 나타내는 색인은 좌->우, 상->하로 부여된다.

##따라서, 리스트의 첫 벡터에 의한 색인 1,1,2,2,1,1,2,2은 차례로
##(spring, male), (summer, male), (fall, male), (winter, male)
##(spring, female), (summer, female), (fall, female), (winter, female)로 색인

##성별을 나타낸 두번째 벡터에 의한 1,1,1,1,2,2,2,2의 색인은
##첫 4개는 male, 다음 4개는 female로 색인을 부여한다.

##최종적으로 sum이 동작할 때, 같은 그룹끼리의 연산에 의해 
##성별/반기별 합이 계산된다.

##그림 설명
##행:    1 1 2 2 1 1 2 2
##data: 1 2 3 4 5 6 7 8
##열:    1 1 1 1 2 2 2 2

##           1  1  2  2 (열)
##(행) 1: 1+2  5+6
##(행) 2: 3+4  7+8
## ---------------------------
##       1:    3    11
##       2:    7    15

##tapply()는 같은 cluster에 속한 데이터들의 x좌표 평균, y좌표 평균을 계산
##실상은 비슷한 방법임: sum -> mean


##5) mapply(): sapply()와 유사. 다수의 인자를 함수에 전달
mapply(function(i, s){
	sprintf("%d%s", i, s)
}, 1:3, c("a", "b", "c"))
## sprintf()함수는 데이터를 문자열로 변환하는 함수
## %d%s는 각각 정수와 문자열 변수를 받겠다는 의미이다.

## iris의 각 컬럼 평균을 구하는 경우
mapply(mean, iris[1:4])
class(mapply(mean, iris[1:4]))
sapply(iris[1:4], mean)
class(sapply(iris[1:4], mean))

##6) list에 xapply()적용하기
lapply(list(2:5, 35:39), median) #결과가 list
sapply(list(2:5, 35:39), median) #결과가 vector


##5.6 doBy 패키지
##summaryBy(), orderBy(), splitBy(), sampleBy() 등 값에 따른 데이터 처리

## 1) base::summary(): 자료에 대한 통계분석 및 머신러밍 모델에 대한 요약
## => generic 함수: 인자에 따라 다른 동작을 수행하는 함수
summary(iris)
iris3
## [q]summary()를 이용하여 iris3에 대한 통계분석을 해보아라.
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, seq(0, 1, by=0.1))

install.packages("doBy")
library("doBy") # 설치한 패키지 사용을 위해 require("doBy")를 해도 된다.

## 2) summaryBy(): 특정 열의 값을 특정 조건에 따라 요약한다.
summaryBy(Sepal.Width + Sepal.Length ~ Species, iris)
## formula: a + b ~ c

## 3) orderBy(): 특정 열을 기준으로 정렬한다.
orderBy(~ Sepal.Width, iris) # 모든 열을 표시하므로 ~ 좌측은 공백임
orderBy(~ Species + Sepal.Width, iris) 
## Species로 정렬 후, Sepal.Width로 정렬

## 보통 orderBy()보다는 base::order()를 더 많이 사용한다.
order(iris$Sepal.Width) #Sepal.Width순으로 정렬시 61행, 63행 ...
iris[order(iris$Sepal.Width), ] #정렬결과의 확인


## 4) sampleBy()

## base::sample(): 임의의 샘플을 추출. 기본은 중복을 허용하지 않음
## 중복허용시 replace=T를 지정
sample(1:10, 5) #1:10에서 임의의 수 5개를 샘플링
sample(1:10, 5, replace=T)

sample(1:10, 10) # 무작위로 섞기
iris[sample(NROW(iris), NROW(iris)),] # 행의수까지 행의 수만큼 샘플링

## 각 Species별로 10%씩 sampling하기 -> sampleBy()가 유용
sampleBy(~Species, frac=0.1, data=iris)


##5.7 split(): 데이터 분리에 사용 split(데이터, 분리조건)
split(iris, iris$Species) #반환값은 리스트이다.

## 종별 Sepal.Length의 평균을 구해보자.
lapply(split(iris$Sepal.Length, iris$Species), mean) # 리스트
tapply(iris$Sepal.Length, iris$Species, mean) # 이전 결과와 비교. 배열
## <참고> sapply()의 반환값은 벡터, 행렬


##5.8 subset(): 특정 부분만 취하는 용도
## iris에서 setosa종만 뽑아내기
subset(iris, Species == "setosa")
## 벡터연산에서 AND는 &&가 아닌 &를 사용한다.
subset(iris, Species == "setosa" & Sepal.Length > 5.0)
NROW(subset(iris, Species == "setosa" & Sepal.Length > 5.0)) 
nrow(subset(iris, Species == "setosa" & Sepal.Length > 5.0))
## NROW는 벡터와 행렬 모두 사용 가능

## select 인자 지정을 통한 특정 열의 선택/제외
subset(iris, select=c(Sepal.Length, Species))
subset(iris, select=-c(Sepal.Length, Species))


##5.9 merge(): 두 데이터 프레임을 공통기준으로 병합
x <- data.frame(name=c("a", "b", "c"), math=c(1, 2, 3))
y <- data.frame(name=c("c", "b", "a"), english=c(4, 5, 6))
merge(x, y) # 이름의 순서가 달라도 이름을 기준으로 잘 병합됨
cbind(x, y) # cbind()는 단순히 열을 합할 뿐이다. 

## 공통된 이름이 없는 경우
x <- data.frame(name=c("a", "b", "c"), math=c(1, 2, 3))
y <- data.frame(name=c("a", "b", "d"), english=c(4, 5, 6))
merge(x, y) #inner join
merge(x, y, all=T) #outer join. 비공통인 경우 NA


##5.10 sort(), order(): 데이터 정렬을 위한 함수
##정렬된 결과를 반환한다.
x <- c(20, 11, 33, 50, 47)
sort(x)
sort(x, decreasing=T)
x # 정렬 결과를 반환할 뿐이지, 벡터를 변경시키지 않는다.

order(x) # 행의 정렬순서(색인)을 반환한다.
x[order(x)]
order(-x) # 내림차순의 정렬
head(iris[order(iris$Sepal.Length), ])
head(iris[order(iris$Sepal.Length, iris$Petal.Length), ])


##5.11 with(), within()
## with(): 데이터 프레임 또는 리스트내 필드에 접근. with(data, 표현식)
print(mean(iris$Sepal.Length))
print(mean(iris$Sepal.Width))

with(iris, {
	print(mean(Sepal.Length))
	print(mean(Sepal.Width))
})
str(with(iris, {
	print(mean(Sepal.Length))
	print(mean(Sepal.Width))
}))
??base::with

## within(): 데이터를 수정하는데 이용
x <- data.frame(val=c(1,2,3,4,NA,5,NA))
x <- within(x, {
	val <- ifelse(is.na(val), median(val, na.rm=T), val)
})
x
data(iris)
iris[1, 1] = NA
head(iris)
median_per_species <- sapply(split(iris$Sepal.Length, iris$Species),
	median, na.rm=T)
iris <- within(iris, {Sepal.Length <- 
	ifelse(is.na(Sepal.Length), median_per_species[Species],
	Sepal.Length) })
head(iris)

str(split(iris$Sepal.Length, iris$Species))
str(median_per_species)
data(iris)
iris #저장하지 않아서 원래 data를 다시 호출함


##5.12 attach(), detach()

##5.13 data 입력 - 분할표
trial<-matrix(c(34,11,9,32), ncol=2)
colnames(trial)<-c('sick', 'health')
rownames(trial)<-c('risk', 'norisk')
trial.table<-as.table(trial)
trial.table
class(trial.table)


#merge
x<-data.frame(name=c("a" ,"b" ,"c", "d"), math=c(1, 2, 3, 4))
y<-data.frame(name=c("a" ,"b" ,"c", "e"), english=c(1, 2, 3, 5))
merge(x,y)

#7.3 reshape2패키지
#7.3.1 melt()
library(reshape2)
data(french_fries)
head(french_fries)
m<-melt(id=1:4, french_fries)
head(m)
?cast

### 기타
## 기타
ls() # objects목록 출력
names(mydata) # mydata에 있는 변수 목록
str(mydata) # mydata의 구조를 출력
levels(mydata$v1) #mydata의 v1 factor의 level
dim(object): object의 차원
class(object): object(numeric, matrix, data frame, etc)의 class
head(mydata, n=10) #처음 n개의 row를 출력
tail(mydata, n=5) #끝 n개의 row를 출력


## 연산자: vector, matrix, scalar 모두에 적용돔

## 문자함수
substr(x, start=n, stop=m) #문자벡터 x에서 substring 추출
grep(pattern, x, ignore.case=F, fixed=F)
sub(pattern, replacement, x, ignore.case=F, fixed=F)



rnorm(10) #표준정규분포를 따르는 10개의 랜덤넘버를 생성
#한줄에 두개의 명령어를 입력시
mean(abs(rnorm(10))); hist(rnorm(10));
getwd() # 현재 폴더를 확인할 수 있음
dir.create("c:\\Rtraining") # 폴더를 생성
setwd("c:\\Rtraining") # 작업 폴더를 설정
##\ 대신에 \\로 표현하거나, /을 사용해야 한다.
dir.create("c:/Rtr")
setwd("C:/Users/Administrator/Documents")
##패키지 설치를 통한 사용가능한 data set 확인
data()
## 개별 data set의 세부 내용
BOD #데이터 셋의 내용을 확인. 생물학적 산소 요구량
help(iris)
## 현재 작업환경의 옵션의 내용
options
lm(mpg~wt, data=mtcars)
fit <- lm(mpg~wt, data=mtcars)
mtcars
str(fit)
sink("myfile.Rdata", append=F, split=T)
lm(mpg~wt, data=mtcars)
sink()
data("C:/Users/Administrator/Documents/myfile.Rdata")

##패키지의 설치. 현재 약 5100여개 패키지가 있음
install.packages("vcd")
help(package="vcd")
library(vcd)
Arthritis #관절염 임상 데이터
example(Arthritis)

## 작업환경의 customizing
# R은 항상 Rprofile.site를 먼저 수행
# c:\program files\R\R-n.n.n\etc 폴더에 존재
# Rprofile.site를 찾는 순서: 현재 작업 폴더 > 사용자의 홈 폴더
# Rprofile.site 파일에 2개의 함수를 지정 가능
# - .First(): R session이 시작될 때 수행
# - .Last(): R session이 종료될 때 수행

## Batch 처리

# 분할표(contingency table)의 이용
trial <- matrix(c(34,11,9,32), ncol=2)
colnames(trial) <- c('sick', 'healthy')
rownames(trial) <- c('risk', 'no_risk')
trial.table <- as.table(trial)
class(trial.table)
trial.table


# R의 그래프 기초
## 데모프로그램을 이용한 접근
demo(graphics)
demo(persp)
## 기본 프로그램
plot(c(1,2,3), c(1,2,4))
Nile #나일강의 유속을 1871년부터 1970년까지 100년간 기록
mean(Nile)
sd(Nile)
hist(Nile)

##회귀직선 그리기
attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt)) #absolute line을 overlap하여 그리기
title("Regression of MPG on Weight")
detach(mtcars)

ls()
## 예
x=seq(0, 2*pi, 0.1)
y=cos(x)
par(mfrow=c(2,2)) #mfrow는 multiple plot. 2x2로 4개의 그림
plot(x,y, type="b", main="cosie 그래프", sub="type=b")
plot(x,y, type="o", las=1, bty="u", sub="type=o")
plot(x,y, type="h", bty="7", sub="type=h")
plot(x,y, type="s", bty="n", sub="type=s")

## abline()
data(cars)
attach(cars)
par(mfrow=c(2,2))
plot(speed, dist, pch=1); abline(v=15.4)
plot(speed, dist, pch=2); abline(h=43)
plot(speed, dist, pch=3); abline(-14,3)
plot(speed, dist, pch=8); abline(v=15.4); abline(h=43)
detach(cars)

##dotchart
par(mfrow=c(1,1))
data(mtcars)
dotchart(mtcars$mpg, labels=row.names(mtcars), cex=.7, 
	main="모델별 휘발유 마일리지", xlab="Gallon당 mile수")

x <- mtcars[order(mtcars$mpg),]
x$cyl<-factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg, labels=row.names(x), cex=.7, groups=x$cyl,
	main="Gas Mileage for Car Models\n grouped by cylinder",
	xlab="Miles per Gallon", gcolor="black", color=x$color)


##막대plots
# simple bar plot
counts <- table(mtcars$gear)
counts
barplot(counts, main="Car Distribution", xlab="Number of Gears")

# simple Horizontal Bar + Label 추가
barplot(counts, main="Car Distribution", horiz=T,
	names.arg=c("3Gears", "4Gears", "5Gears"))

# stacked bar plot
counts<-table(mtcars$vs, mtcars$gear)
barplot(counts, main="Gear와 VS에 따른 자동차 분포", xlab="Gear수",
	col=c("darkblue", "red"), legend=rownames(counts), beside=T)
rownames(counts) #mtcars$vs의 범주값을 의미함
counts
#vs는 vertical engine 또는 straight를 구분


##line chart(선도표)
x<-c(1:5); y<-x
par(pch=22, col="red")
par(mfrow=c(2,4))
opts=c("p", "l", "o", "b", "c", "s", "S", "h")
for(i in 1:length(opts)){
	heading=paste("type=", opts[i])
	plot(x,y, type="n", main=heading)
	lines(x,y, type=opts[i])
}


##pie chart
slices<-c(10,12,4,16,8)
lbls<-c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels=lbls, main="Pie Chart of Countries")

#백분율 표시
pct<-round(slices/sum(slices)*100)
lbls<-paste(lbls, pct)
lbls<-paste(lbls, "%", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)),
	main="Pie Chart of Countries")


## 박스플랏
#clinder별 mpg에 대한 상자 그림
attach(mtcars)
boxplot(mpg~cyl, data=mtcars,
	main="자동차 Mileage데이터",
	xlab="cylinder수", ylab="Miles/Gallon")
detach(mtcars)


##산점도
attach(mtcars)
plot(wt, mpg, main="scatterplot의 예",
	xlab="자동체무게", ylab="Miles/Gallon",
	pch=19)
detach(mtcars)


# 기초통계
## 확률함수
qnorm(0.05, mean=0, sd=1)
qnorm(0.95) #mean=0, sd=1는 default
dnorm(0)

x=rnorm(100)
hist(x, probability=T, col=gray(.5), main="정규곡선, mu=0, sigma=1")

##밀도plot
#Kernel Density Plot
d<-density(mtcars$mpg)
plot(d) #plots the results
hist(mtcars$mpg)

#mpg분포를 cylinder별로 비교
install.packages("sm")
library(sm)
attach(mtcars)
#value label생성(factor로 변환. 원래 cyl=4,6,8의 수치변수)
cyl.f<-factor(cyl, levels=c(4,6,8),
	labels=c("4 cylinder", "6 cylinder", "8 cylinder"))
#밀도곡선의 plotting
sm.density.compare(mpg, cyl, xlab="Miles/Gallon")
title(main="MPG Distribution by Car Cylinders")
#마우스를 클릭하는 곳에 legend를 추가
colfill<-c(2:(2+length(levels(cyl.f)))) #vector of color
legend(locator(1), levels(cyl.f), fill=colfill)


#빈도수와 분할표(contingency table)


#상관관계
##mtcars의 수차 변수간 상관관계/공분산. 결측치는 listwise deletion
cor(mtcars, use="complete.obs", method="kendall")
cov(mtcars, use="complete.obs")

##상관관계의 검정 및 유의도
#cor.test()는 하나의 상관계수를 검정
#Hmisc package의 rcorr()는 pearson, spearman에 대한 유의성 검증
#- 이때, 입력항목은 matrix이고 pairwise deletion적용
install.packages("Hmisc")
library(Hmisc)
mtcars
rcorr(as.matrix(mtcars[2:3]), type="pearson")
rcorr(as.matrix(mtcars)) #data.frame을 matrix로 변경함


#회귀분석
data(women)
women
fit<-lm(weight~height, data=women)
summary(fit)
women$height
fitted(fit)
residuals(fit)
plot(women$height, women$weight)
abline(fit)

#rattle설치
install.packages("rattle", dependencies=T)
library(rattle)
rattle()

## R book 2.13 R에서 날짜와 시간
Sys.time()
# [1] "2015-09-30 16:22:13 KST"

time.list<-as.POSIXlt(Sys.time())
#범주화된 time형식으로 변경하여 관리할 수 있다.
unlist(time.list)

data<-read.csv("C:/educ/R/therbook/dates1.csv", header=T)
str(data)
# 'data.frame':  16 obs. of  2 variables:
#   $ trial     : Factor w/ 2 levels "A","B": 1 1 1 1 1 1 1 1 2 2 ...
# $ time.value: Factor w/ 16 levels "2005-10-23 1:42:7",..: 7 14 15 10 16 11 12 4 6 1 ...

attach(data)
Rdate<-strptime(as.character(time.value), "%Y-%m-%d %H:%M:%S")
class(Rdate)
[1] "POSIXlt" "POSIXt" 
data<-data.frame(data, Rdate)
head(data)
str(data)

# 시간대별 trial값의 빈도
tapply(trial, Rdate$hour, table)
dataforHour<-unlist(tapply(trial, Rdate$hour, table))
head(dataforHour)
# 1.A 1.B 2.A 2.B 3.A 3.B 
#   1   3   3   4   3   1 
detach()

y<-strptime("01/02/2014", format="%d/%m/%Y")
weekdays(y)
y$wday

Sys.timezone()
other.dates<-c("1jan99", "2jan05", "31mar04", "30jul05")
str(other.dates)
# strptime(other.dates, "%d%b%y", tz="GMT")
# strptime(other.dates, format="%d%b%y") # NA 벡터만 발생. why?
strptime("1jan99", format="%d%b%y")

strptime(other.dates, format="%d%b%y", tz="EST")

# difftime - 2개의 날짜 사이의 일 차를 반환
yet.more.dates<-c("2015 42 Mon", "2015 48 Mon", "2015 50 Mon")
#2015년 42번째주 월요일 등
as.difftime(yet.more.dates, "%Y %W %a", units="days")
# Error in match.arg(units) : 
#   'arg'은 반드시 “auto”, “secs”, “mins”, “hours”, “days”, “weeks” 중 하나이어야 합니다

difftime("2014-02-06", "2014-07-06")

y1<-as.POSIXlt("2015-10-22")
y2<-as.POSIXlt("2015-10-24")
y1-y2 #unit: days
difftime(y1, y2)

t1<-as.difftime("6:14:21")
t2<-as.difftime("6:14:28")
t1-t2 #unit: hours
as.numeric((t1-t2)*3600)
# difftime(t1, t2) #에러
# difftime("6:14:21", "6:14:28") #에러


# 날짜 배열 생성
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2015-11-15"), "1 day")
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2016-04-05"), "2 weeks")
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2018-10-04"), "3 months")
seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2026-02-15"), "year")

seq(as.POSIXlt("2015-11-04"), as.POSIXlt("2015-11-05"), 8955) # 초단위로 인식
seq(as.POSIXlt("2015-11-04"), by="month", length=10)

result<-runif(16)
seq(as.POSIXlt("2015-11-04"), by="month", along=result)

weekdays(seq(as.POSIXlt("2015-11-04"), by="month", along=result))
months(seq(as.POSIXlt("2015-11-04"), by="month", along=result))

y<-as.Date(1:100, origin="2015-12-31") #2016년 첫 100일까지의 날짜
head(y)
x<-as.POSIXlt(y)
x[x$wday==1] #월요일만 추출

y<-as.POSIXlt(as.Date(1:365, origin="2015-12-31"))
data.frame(monday=y[y$wday==1], month=y$mo[y$wday==1])[1:12,]

wanted<-!duplicated(y$mo[y$wday==1]) #중복되지 않는 행의 index만 선택
y[y$wday==1][wanted] #매월 첫 월요일만 선택


########### 알까기 #############################################

# 데이터 참고
# 1. 서울시 공공 데이터(data.seoul.go.kr)
# 2. 통계청(www.kostat.go.kr)
# 3. 국가 통계 포털(kosis.kr)

### dynamic chart
install.packages("googleVis")
library(googleVis)
data(Fruits)
head(Fruits)
t1<-gvisMotionChart(Fruits, idvar="Fruit", timevar="Year")
plot(t1)
