# 함수

> 어떠한 값을 입력하면 정의된 절차에 따라 일을 수행한 후 결과물을 내는 것

- 파이썬에서의 함수 = `def 함수명(매개변수):`

```python
def 함수명(매개변수): 
	수행할 문장 
	수행할 문장
	return 결과값
```



args and kwargs 뭥야 이게



#### 1 이상의 정수 N을 입력받은 후 1 ~ N 까지의 합을 구하는 함수

```python
def plusAll(num):
    total = 0
    for i in range(1,int(num)+1):
        total += i
    return total
num = input() #항상 문자열이 됨... int로 변환해주어야 함
print(plusAll(num))
```



변수의 유효범위 어려워어려워

지역변수 전역변수



### lambda

함수를 생성할 때 사용

def 예약어와 동일한 역할

일회용이라는느낌... 간단하게 즉석에서 그 자리에서 함수를 만들어쓰는 느낌... ㅎ

아주 복잡한 함수를 넣기에는 적합하지 않다.

```python
plus = lambda a, b: a + b
result = plus(10, 20)
print(result)
```

def plus(a,b):

​	return a+b 와 같은 의미



javascript의 closure와 비슷함

--> 함수가 함수를 반환







이게 멀까

```python
text='' #전역변수
def str_adder(*args):
    global text
    
    for i in args:
        text += i
        
str_adder('1', '2', '3', '4')
print(text)
```

리스트 컴프리헨션과 람다를 조합해서 활용하기

```python
def myfunc(numbers):
    result = []
    for number in numbers:
         if number > 5:
            result.append(number)
    return result
result = myfunc([2, 3, 4, 5, 6, 7, 8])
print(result)
```

이런 함수를

```python
ns = [2, 3, 4, 5, 6, 7, 8]

myfunc = lambda numbers : [ number for number in numbers if number > 5 ]
myfunc(ns)
```

이렇게 줄일 ㅅ ㅜ있다...... 흐으윽

List Comprehension은 결국 리스트를 만드는 것이다..

