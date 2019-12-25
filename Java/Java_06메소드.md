# 메소드

메소드는 만들었으면  main 내에서 new를 불러줘야한다

배열을 메소드에게 넘기는 것도 가능



## 매개변수

### 반환값과 return;

- 함수가 결과물을 반환한다는 뜻. 반환하는 순간 함수는 종료된다
- return 안쓰고 싶으면 void를 활용
- void 내에서 return; 나오면 메소드 실행 종료??? break;보다 강력한 종료다



### static

- 이게 있으면 자기가 자기 메소드 불러쓰는 데에 제약을 건다
- 붙여있는 main이라는 메소드를 메모리에 먼저 등록하는 역할을 한다
- `new`가 메모리에 등록한하는 역할
- 등록된 것 끼리 서로 부를 수 있다. 고로 메소드 앞에 static 붙여주면 new 없이 사용 가능.

### 메소드로 골뱅이탑 찍기

```java
public class Method {
	/**
	 * 1000을 반환하는 메소드
	 * 
	 * @return
	 */
	int sum() {
		return 1000;
	}

	int sum(int a, int b) {
		return a + b;
	}

	String print(int count, String s) {
		String result = "";
		for (int a = 1; a <= count; a++) {
			for (int b = 1; b <= a; b++) {
			//	System.out.print(s);
				result = result + s;
			}
//			System.out.println();
			result = result + "\n";
		}
		return result;
	}

	public static void main(String[] args) {
		Method m = new Method();
		String r = m.print(7, "@");
		System.out.println(r);
	}
	}
```



미완서엉