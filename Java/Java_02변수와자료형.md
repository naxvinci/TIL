# 2) 변수 및 자료형

### 변수

- 변수는 먼저 선언 및 초기화를 해주어야 한다.
- 프로그래밍에서는 `=`의 연산방향이 반대다. 
  - a = b; b를 a의 값에 넣는다(담아준다)
- 변수명은 소문자 형식으로. 의미를 가지게끔 써준다. 한글도 가능하며, 길이제한은 없다. 자바예약어는 쓸 수 없다.

#### 변수 값 저장하기

```java
int value = 30;
int result = value + 10;
```

- 초기화는 굳이 0이 아니어도 된다.
- 변수 value를 30으로 초기화
- 변수 value 값을 읽고 10을 더한 결과값을 변수 result에 저장
- `int score1;
  		score1 = 90;` 와 같이 선언과 초기화를 분리하는 것도 가능.



#### Literal(리터럴)

```java
 int a = 10;
 float f = 3.14f;
 boolean b = true;
 String s = "문자열";
```

- int와 long은 정수
- float와 double은 실수
- boolean은 참 거짓 논리
- String은 문자 혹은 문자열
- char은 문자



### 컴퓨터에서 데이터 표현하기 

 ● 0과 1로만 데이터를 저장

 ● bit : 컴퓨터가 표현하는 데이터의 최소 단위(2진수)이며, 하나의 값을 저장할 수 있는 메모리의 크기

 ● 1byte = 8bit



#### 1. 변수를 넣어 계산하기

- 2의 38제곱 구하기 `Math.pow(2, 38)`
- char 함수의 값을 형변환 하여 int 함수에 담기
- 

```java
package ch02;

public class Variablee {
	public static void main(String[] args) {
		double value = Math.pow(2, 38);
		System.out.println((int) value);
		System.out.println((long) value);

		int 변수 = 100;

		char ch = 'Z';
		int ch2 = (int) ch;
		System.out.println(ch2);

		char ch3 = (char) (ch2 - 1);
		System.out.println(ch3);
	}
}
```



### 형변환과 overflow 

> 몰라 이걸 어떻게 설명하니



