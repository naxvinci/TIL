# 예외처리

shft + ctrl + -  ==>  주피터노트북 행분리

shft + m ==> 명령모드에서 두 행 merge

> 프로그래밍에서는 완성도를 높이기 위해서 예외처리를 잘해야 한다.



## 오류가 발생하는 여러 상황

-  ZeroDivisionError 

  : division by zero 2 / 0 (0으로 나누면 나는 오류)

- IndexError : list index out of range list = [] list[0] 
- TypeError : unsupported operand type(s) for +: 'int' and 'str' 4 + '' 
- FileNotFoundError: [Errno 2] No such file or directory: 'python.txt' file = open('python.txt', 'r') 
- TypeError: unsupported operand type(s) for +: 'set' and 'set' {1, 2} + {3}



## 오류 예외처리 기법

#### 예외처리 기본 구조

try-except

예상 가능한 상황이지만 정확하게 케이스를 끄집어 낼 수 없는 경우, ... 대충 던져버림

이 대충 던져버리는 것이 try-except

except는 만능이 아니다. 어떤 오류종류에 따라서는 안될 수 있다. 

#### 예외 발생 없이 깔끔하게 실행된 경우

try - except - else

예외 발생 없이 try 다 끝나면 except없이 else로 넘어가도록

#### 예외 발생 되었든말든 무조건 항상 실행할 경우

try - except - finally

외부의 다른 기능들과 같이 연계해서 사용할 때 많이 쓰인다. 아마존 클라우드에 접속했다가 여러 명령 실행하는 도중 에러가 나는 경우 접속이 안끊킨다... 그럼 close를 finally에 넣어주면서 활용

#### 예외처리 여러개 하는 경우

try - except - except



### 의도적 오류 발생

#### raise

라이브러리를 설계하는 개발자가 활용하려는 개발자에게 반드시 메소드를 오버라이딩 후 사용하도록 하기 위해

### 오류 만들기

```python
class CustomError(Exception):
 pass
```

현재 개발하려는 서비스 상황에 알맞은 오류를 찾을수 없을 때 직접 오류를 만들어서 쓴다...

Exception이라는 클래스를 상속받는 것임

명칭만 그럴듯하게 넣는거지 결국 프로그램 강제 종료하는 기능뿐임 ^^;

스프링에서 log.debug('어쩌구') 한 것들도 결국에는 로그 창에 찍는 것일 뿐인것처럼~

