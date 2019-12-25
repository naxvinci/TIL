# 배열(Array)

> 처리데이터가 많을 때 용이하다. 변수의 수가 줄어들 수 있음.

## 배열의 선언과 생성

- `자료형[] 배열이름 = new 자료형[개수]`
- `int[] arr1 = new int[10]` --> 값이 다 0으로 채워진다
- `배열이름.length` : 배열의 크기를 알려준다



### 배열만들기

```java
		// 배열 만들기 1
		int[] arr1 = new int[5];

		// 배열 만들기 2
		int[] arr2 = { 5, 6, 7, 8, 9, 10 };

		// 배열 만들기 3
		int[] arr3 = new int[] { 5, 6, 7, 8 };

		int num = arr2[4]; // 9
		
		for (int i = 0; i < arr3.length; i++) {
			System.out.println(arr3[i]);
		}
```

- 두번째 배열이랑 세번째 배열의 차이가 뭘까



###  배열에서 인덱스가 홀수인 요소 출력하기

```java
		int[] arr = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };

		String sep = "";
		for (int i = 0; i < arr.length; i = i + 2) {
			System.out.print(sep + arr[i]);
			sep = ",";
		}
```

- 첫 시작이 콤마로 시작하면 안되므로 첫 선언은 "" 공백으로함
- 배열[인덱스]



### 알파벳 순서로 재배열하기

- 제3의 변수를 만들어 바꿔치기 하기

```java
		char[] arr = { 'r', 't', 'a', 'b', 'w' };
		Arrays.sort(arr);
		
		for (int i = 0; i < arr.length - 1; i++) {
			for (int j = i + 1; j < arr.length; j++) {
				char second = arr[j];
				if (arr[i] > second) {
					char temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}
			}
		}
		System.out.println(arr);
```

- 먼저 복사본을 다른 변수에 담아두고 그것과 하나씩 비교시작
- temp 변수를 만들어 계속 비교해나갈 수 있게



### for문을 활용해서 빙고판 만들기

```java
		Scanner s = new Scanner(System.in);
		System.out.println("빙고 크기를 입력해주세요.");
		int size = s.nextInt();

		int[][] bingo = new int[size][size];
		for (int i = 0; i < size * size; i++) {
			bingo[i / size][i % size] = i + 1;
		}
		// 출력
		for (int i = 0; i < size; i++) {
			for (int j = 0; j < size; j++) {
				System.out.print(  bingo[i][j] < 10 ?
						"0" + bingo[i][j] + " " 
						: bingo[i][j] + " ");
			}
			System.out.println();
		}
		s.close();
```







### 이차원배열 [][]

- `[][]`
- 배열 하나짜리 안에 배열이 하나 더 있다



```java
		int[][] arr = { 
			{1, 2}, 
			{3, 4}, 
			{5, 6} 
		};
		int value = arr[1][1];
		System.out.println(value);
```

- 4가 출력된다



