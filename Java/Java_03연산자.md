# 3) 연산자

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



