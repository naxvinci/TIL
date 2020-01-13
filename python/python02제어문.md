제어문

- 조건문
  - if 
  - if – else 
  - if – elif – else 

- 반복문
  - while 
  - for



#### if

삼항연산자는 제어문이 아니라 조건'식'이다. 

파이썬에서의 for는 오로지 for each라는 개념만 가진다. 이미 반복할만한 다중요소를 가지고 있고 그곳에서 뽑아내는 것임. 

범위를 정해주고 그걸 돌리는게 아니라 그 요소들이 더이상 없을 때까지 뽑아내는 것임. 범위지정이 되지않는다.

범위는 지정해서 쓰려면 while을 사욯하게 된다



- if문 뒤에 오는 조건식은 반드시 결과가 True 혹은 False값으로 나오는 것이어야 한다.
- 중괄호를 쓰지 않고 콜론(:)을 쓴다. 
- 들여쓰기가 중요하다. 같은 들여쓰기 해야함. 
- else if => elif라 쓴다

- 한 줄만 쓸거면 콜론 뒤에 바로 써도 된다

  ```python
  score = 50
  if score >= 60: print('통과')
  else: print('불합격')
  ```



#### 논리연산자

- or ( and 보다 우선순위가 떨어져서 오류가 나는 경우 있다)
- and
- not

- in - 앞의 요소가 뒤의 요소에 포함이 되는지 여부
  - not in 처럼 합쳐서 사용도 가능하다

#### 조건부 표현식

- ```python
  score = 40
  if score >= 60:
   print('PASS')
  else:
   print('FAIL')
  
  ```

  이렇게 쓰는 것을

- ```python
  print('PASS') if score >= 60 else print('FAIL')
  ```

  조건부 표현식을 통해 이렇게  쓰는 것도 가능



#### while

```python
count = 0
while count < 10:
  count = count + 1
  print('%d번 반복' % count)
print('%d번 반복 후 종료' % count)
```

```shell
1번 반복
2번 반복
3번 반복
4번 반복
5번 반복
6번 반복
7번 반복
8번 반복
9번 반복
10번 반복
10번 반복 후 종료
```



formatting의 방식에는 두가지가 있다. 중괄호를 이용해서 format을 하는 것과 %를 이용하는 것

#### 1부터 1000까지의 정수 합 구하기

```python
num = 1
total = 0
# 코드 작성
while num <= 1000:
    total += num
    num += 1

print(total)
```

#### 1부터 1000까지의 정수 중 3의 배수합 구하기

```python
num = 1
total = 0
# 코드 작성
while num <= 1000:
    if num % 3 == 0:
        total += num
    num += 1

print(total)
```



#### break

반복문 강제 종료

```python
import random

while True:
    num = random.randint(1,3)
    print('%d' % num)
    if num == 2: break
```

1부터 3 사이의 (randint 3포함) 숫자들 중 랜덤으로 숫자를 뽑아 찍는데 2가 나올 경우 강제 종료하라



#### continue

반복문의 처음으로 돌아가기

 

### for

for [변수] in [자료형]:  과 같은 형태



for each의 형태이기 때문에 몇번째가 동작하고 있는지 등이 가시적으로 보이지 않는다



#### range() 

반복 범위를 지정해준다

ex) range(1,10)

1부터 9까지의 숫자 목록을 만들어주는 함수



#### list Comprehension

`[표현식 for 항목 in 반복가능객체 if 조건]`

```python
data = list(range(1,101))
result = [ x for x in data if x % 17 == 0 ]
print(result)
```

결과는 `[17, 34, 51, 68, 85]`가 출력이 된다



####  1 ~ 100 사이의 숫자 중 3을 포함하고 있는 숫자와 그 개수를 출력

```python
count = 0
# 코드 작성
# 자료의 내부 값 확인 in 연산자 이용
for i in range(1,101):
    if '3' in str(i):
        print(i)
        count += 1
# 숫자를 문자열로 바꾸기 str(숫자) 함수 이용
print("끝" + str(count) + "개")     
```







#### 리스트의 각 요소가 3의 배수인지 확인하여 삭제하기

```python
list1 = [10, 20, 30, 40, 50, 60, 70]
# 코드 작성
result=[]
for i in reversed(range( len(list1))):
    if list1[i] % 3 == 0:
            list1.pop(i)
        
print(list1)

# remove() 함수를 사용하지 말고 pop() 함수를 이용하여 작성
```

- len(), reversed() 등 활용

