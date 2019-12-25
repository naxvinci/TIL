# 자바 4 조건문 반복문

### if문 활용

```java
			 int workingTime = 7; // 근무시간

			 // 코드 작성
			 if(workingTime > 8){ 
                 System.out.println("퇴근");}
			 else {	 
                 System.out.println("계속근무");}
```

- 자꾸 헷갈리는데 syso 끝난 소괄호 바로 바깥에 ;세미콜론 찍어주는것임
- if(조건식){지시;}
- 최종 결과가 true/false로 나올 수 있는 연산식을 넣어야 한다. (비교 연산자)





### switch문이란

switch문은 가독성이 좋지만 정확하게 명시해야 사용이 가능해서 다소 불편하다. 전세계적으로 잘 바뀌지 않는 혈액형, 국가의 위치 등 가짓수가 그리 많지 않은 것이 좋다.



### for문을 활용하여 1부터 99까지의 합구하기

```java
public class Exam4_4_1 {
	public static void main(String[] args) {
		// 코드 작성
		int total = 0;
		for(int i = 1; i <= 99; i = i + 1) {
			total = total + i;
		}
		System.out.println(total);
	}
}
```

- for문의 구조를 외우자 `for(초기값; 조건식; 증감식)` 
- `for(;;)` : 무한반복하겠다는 것임

- 1부터 5까지 5번 동작해!가 용이. 한 줄로 가능하다.

### for문 안에 if문을 통해 거르기

- //		 1000 이하의 자연수 중에서 2의 배수이면서 7의 배수인 숫자를 출력
  //		 출력된 숫자들의 합을 구하는 코드 작성

```java
		int total = 0;
		for (int i = 1; i <= 1000; i++) {
			if (i % 14 == 0) {
				total = total + i;
			}
		}
		System.out.println(total);
```

- `i++`은 `i= i +1`과 같은 의미
- 값의 합을 구할 때 자주 쓰는 `total = total + i'



### while문

- 무한반복, 몇번이나 반복해야 할지 모를 때
- 똑같은 눈금이 나오면 무인도 탈출 등
- 주어진 조건에 만족되면 중괄호 내의 명령문이 계속 호출된다
- 제어문끼리는 중첩이 가능하다
- 중첩 while은 거의 쓰지 않는다 복잡하기 때문에



### while문을 이용해서 랜덤주사위의 경우 출력하기

- 두개의 주사위를 던졌을때 나오는 눈을 (눈1, 눈2) 형태로 출력하고, 눈의 합이 10이면 실행을 종료하는 코드 작성 (Math.random() 메소드)

```java
		boolean isContinue = true;
		int count = 0;

		while (isContinue) {
			int num1 = (int) (Math.random() * 6 + 1);
			int num2 = (int) (Math.random() * 6 + 1);
			
			// 코드 작성
			System.out.printf("(%s, %s)\n" , num1, num2);
			count = count + 1; // count++;
			if(num1 + num2 == 10) {isContinue = false;//혹은 break;를 써도됨 
			}
		}
		System.out.println("주사위를 던진 횟수 : " + count);
```

- `"(%s, %s)\n"`은 println으로 할 수 없기 때문에 `printf`로 출력하고 `\n`을 해준다
- boolean을 선언하는 방법을 잘 보자
- while반복문 속 boolean이 사실일 동안 반복문이 실행되고 이것이 false일 경우 정지하는 것이다.



### 이중for문을 통해 별찍기



```java
		for (int a = 1; a <= 5; a++) {
			for (int b = 1; b <= a; b++) {
				System.out.print("*");
			}
			System.out.println();
		}
```

- a가 1로 시작. 두번째 for문에 들어가서 b도 1. 조건 만족하니 두번째 포문 한번 찍고 다시 올라오니 b는 2가 되어 두번째 포문을 탈출하여 첫번째 포문의 println 공백을 찍게 된다... 그게 반복



### 이중for문을 통해 구구단 출력하기

```java
		for (int i = 1; i <= 9; i++) {
			for (int j = 2; j <= 9; j++) {
				System.out.print(
						j + " * " + i + " = " + (i * j) + "\t");
			}
			System.out.println();
		}
```

- /t 는 tab(띄어쓰기)



### 조건문과 반복문의 중복으로 각자리 수 비교하기

- 1 ~ 1000 사이의 숫자 중 3을 포함하고 있는 숫자를 출력

```java
		int count = 0;
		for (int i = 1; i <= 1000; i++) {
//	1 ~ 1000 사이의 숫자 중 3을 포함하고 있는 숫자를 출력
			int num = i; // 원본 값인 i를 훼손하지 않고 복사본인 num 변수를 통해 연산하기 위해
			while (num > 0) {
				int n = num % 10;
				if (n % 10 == 3) {
					count++;
//					System.out.println(i + ": 3 포함"); //다시 결과로 나올 값은 고로 num이 아니라 i
//					break;
				}
				num = num / 10;
			}
		}
		System.out.println(count);
```

- for문으로 1부터 1000까지의 숫자를 훑는 틀을 만든다
- 각 자릿수를 비교해야 하기 때문에 % 연산자를 사용하여 수를 쪼개게 된다. 그래서 원본 값인 i를 훼손하지 않고 복사본인 num 변수를 통해 연산해야 한다. 
- while문 부분 도대체 이해가 되지 않는다. 모라는거야 왜 필요해 니가? 
- 아무튼 while문의 조건식으로 인해 각 자릿수를 비교할 수 있게 됨.
- 아니 아나 모르겠어 돌아가는 구조



### do-while문

- 다른 것들 조건 맞지 않으면 시작하지 않는데 얘는 일단 시작부터 한다. 위험하니 거의 쓰지 않는다.



### continue

- 실행이 되다가 다음 루프 순서를 진행해
- continue 아래의 문장들은 실행되지 않는다는 것임. 
- 파일 탐색 중 a라는 alphabet으로 시작하는 파일을 찾을 때



### continue를 활용하여 파일 크기 1000byte 이상 파일 찾기

```java
	File file = new File("C:\\Windows\\System32\\drivers\\etc");
	File[] files = file.listFiles();
	for (int i = 0; i < files.length; i++) {
		long fileSize = files[i].length();
		if (fileSize < 1000) { // 파일크기가 1000Byte 미만이면 아래 코드 무시
			continue;
		}
		System.out.println(files[i].getName() + " / " + fileSize);
	}
```
- i의 조건식에 `.length`의 활용

- 반복문 도중 if -- 이면 continue : 그 아래 식으로 내려가지 말고 다시 올라가서 반복하란 것임

   

### Random 함수 두가지

1. Random 클래스

```java
		// 1번 Random 클래스
		Random r = new Random(); //import
		r.nextInt(10); //랜덤의 범위 지정
		int lotto1 = r.nextInt(45) + 1; // 1 ~ 45

```

- 범위를 지정 시 r.nextInt() 활용한다

2. math.random() 함수

```java
		// 2번 math/ Random() 메소드(함수)
		Math.random(); // 0.0 <= X <1.0
		int lotto2 = (int)(Math.random() * 45) + 1;
		System.out.println(lotto1);
		System.out.println(lotto2);
```

- 랜덤으로 나오는 수가 0부터 1 사이의 수이기 때문에 범위 수를 곱해 맞춰준다. (나올 때는 어차피 int기 때문에)





