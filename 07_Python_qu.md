# Python 예제

1. 문자입력

문제 1.

\# 문자열을 입력받아 문자열의 첫 글자와 마지막 글자를 출력하는 프로그램을 작성하시오.

\# ex) python py_quest.py 실행 후 나타나는 입력란에 

\#   ABCDEFG 입력시 

\#   A G 출력

```python
str = input('문자를 입력하세요: ')
print(str[0],str[-1])
```



```shell
$ python py_quest.py
문자를 입력하세요: ABCDEFG
A G
```



\# 자연수 N이 주어졌을 때, 1부터 N까지 한 줄에 하나씩 출력하는 프로그램을 작성하시오.

\# ex) python py_quest.py 실행 후 나타나는 입력란에

\#   2 입력시 

\#   0

\#   1

\#   2 출력

```python
numbers = int(input('숫자를 입력하세요: '))
n = 0
while n < numbers :
    n = n + 1
    print(n)
```



```shell
$ python py_quest.py
숫자를 입력하세요: 5
1
2
3
4
5
```



선생님의 답안

```python
numbers = int(input('숫자를 입력하세요: '))
for number in range(numbers) :
    print(number)
```



\# 문제 3.

\# 숫자를 입력 받아 짝수/홀수를 구분하는 코드를 작성하시오.

\# ex) python py_quest.py 실행 후 나타나는 입력란에

\#   2 입력시 

\#   짝수 출력

```python
if number % 2 == True :
    print("홀수")
else :
    print("짝수")
```





파이썬에서 1은 True 0은 False이기 때문에 

number % 2 == True

























