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

- for문의 구조를 외우자



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







### switch문이란

