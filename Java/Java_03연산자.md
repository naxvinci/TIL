# 자바 3 연산자

연산자 사용

## 연산자 종류

![img](https://postfiles.pstatic.net/MjAxOTEyMDJfOTkg/MDAxNTc1MjY3NjI1NDY5.np3nR94ekQcJTanTxwmr0Z-xJn0f2DVSyMpm1lfVmhEg.ym-K3eSVNfUYcvx8ODcB1RwYNtlPMtvjcW4vTAIcdYAg.PNG.young_better/image.png?type=w580)



#### 1. Scanner를 활용하여 값을 받아 연산하기



```java
package ch03;

import java.util.Scanner;

public class Operator1 {
	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		System.out.println("숫자를 입력해주세요.");
		int num = s.nextInt();
		boolean result = num % 14 == 0;
		System.out.println(result);
	}
}
```

- Scanner를 불러올 때는 import를 해주어야 한다.
- Scanner로 입력 받은 값의 함수는 `s.nextInt();`
- boolean = 식이 참인지 거짓인지에 따라 true 혹은 false를 출력한다.

```shell
숫자를 입력해주세요.
28
true
```

#### 2. boolean을 활용하여 식의 참거짓 판별 출력

```java
package ch03;

public class Exam03_01 {
	public static void main(String[] args) {
		boolean result = 1 + 2 / 2 >= 1 + 1 * 2;

		System.out.println("결과 : " + result);
	}
}
```

출력값

```
결과 : false
```

#### 3. 형변환 (float)

- 근데 (float) 안쓰면 왜 안되는거지
- float 리터럴을 써줬는데 왜..?

```java
package ch03;

public class Exam03_02 {
	public static void main(String[] args) {
		float div = (float) 5 / 2;

		System.out.println("나누기 결과 : " + div);
	}
}
```

- 결과는 2.5로 출력



#### 4. 

```java
package ch03;

public class Exam03_03 {
	public static void main(String[] args) {
		int 피제수 = 23;
		int 제수 = 5;
		int 몫 = 피제수 / 제수;
		int 나머지 = 피제수 % 제수;
		/* 나머지 구하기 */
		System.out.println("몫 : " + 몫);
		System.out.println("나머지 : " + 나머지);
	}
}
```





```java
int num = 456;

		System.out.println((int) (num / 100 * 100)); // 나누기, 곱하기 연산자 이용
```

- num / 100을 한 값도 int 값으로 나오기 때문에 4가 된다.
- 거기서 100을 다시 곱하면 400... 매 연산마다 int값이 적용되나보다.



### Scanner를 통해 값을 받아 boolean으로 참거짓판별하기

```java
		Scanner scanner = new Scanner(System.in);
		System.out.print("2자리수 정수 입력(10~99)>>");
		int n = scanner.nextInt();
		int ten = n / 10; // 10의 자리 수를 저장할 변수
		int one = n % 10; // 1의 자리 수를 저장할 변수
		boolean isMatch = false; // 두 자리 수 비교 값을 저장할 변수
		/* ten 변수에 10의 자리 수 대입 */
		/* one 변수에 1의 자리 수 대입 */
		/* isMatch 변수에 두 개의 자리 수 비교 값 저장 */
		
		one = n % 10;
		isMatch = ten == one;
		System.out.println(isMatch);
		scanner.close();
```

- 변수 선언에서만 Literal을 사용하고 그 이후 변수에서는 Literal을 선언하지 않는다... 선언하니까 오류 뜸
- boolean도 변수로 바로 사용 `isMatch = ten == one;` 이렇게 써도 돼. 어색한데 맞음 ㅜ

### 제시된 숫자의 각 자리 합 구하기

```java
		int num = 12345;

		int num1 = num % 10;
		num = num / 10;

		int num2 = num % 10;
		num = num / 10;

		int num3 = num % 10;
		num = num / 10;

		int num4 = num % 10;
		num = num / 10;

		int num5 = num % 10;
		num = num / 10;

		// 코드 작성 (% 연산자)

		int total = num1 + num2 + num3 + num4 + num5;
		System.out.println("각 자리 숫자의 합 : " + total);
```

- 나머지(%) 및 나누기(/) 연산자를 이용하기
  - 중간 중간 `num = num / 10을 통해 자릿수를 미리 줄여주면 더 깔끔한 코드를 작성할 수 있다.

### 삼항연산자

(조건식) ? 식1 : 식2

```java
import java.util.Scanner;

public class self1 {
	 public static void main(String[] args) {
		 int score = 0;

		 System.out.print("숫자 입력 > ");

		 Scanner scan = new Scanner(System.in);
		 score = scan.nextInt();

		 char grade = score >= 90 ? 'A' : (score >= 80 ? 'B' : 'C') ;

		 System.out.println(grade);

		 scan.close();

	 }
	}
```

- 삼항 연산자 내에 삼항 연산자를 또 사용할 수도 있다



### 아스키코드를 활용하여 대문자를 소문자로 변경

```java
	    char ch = 'T';
		char lowerCase = (ch >= 'A' && ch <= 'Z') ? ((char) (ch + 32)) : ch;
		System.out.println("ch : " + ch);
		System.out.println("ch to lowerCase : " + lowerCase);
```

- 어차피 컴퓨터는 아스키코드로서 크고작음을 판별하기 때문에 굳이 ch를 int로 형변환해서 비교할 필요 없다. 
- `ch >= 65 && ch <= 90`이따위로 쓰면 인식이 안된다.
- 근데 왜 또 뒤에서는 (char)로 형변환 해줘야 하는겨? 



myFunc(); function myFunc() {};

myFunc(); var myFunc = function() { return 1 };

var myFunc = function() { return 1 }; myFunc();

myFunc()(); function myFunc() { return function() {} }

[SpringBoot을 이용한 웹 응용 개발]
웹 API를 이용하여 영상 정보를 출력하는 웹 애플리케이션을 구현하시오.
\- API url : http://ggoreb.com/m/exam.jsp
\- 필수 출력 정보 : title, description, thumbnails 하위 width/height
Front : HTML5, CSS, JavaScript, Bootstrap 등을 이용하여 구현
Back : String Boot를 이용하여 Controller - View 구현