# Spring Boot

### 스프링부트 다운 받기

 https://spring.io/tools

spring.io/tools 에서 윈도우 이클립스용 스프링 부트를 설치

다운을 받았으면 상단에서 화살표 클릭, powershell을 실행 

powershell에서 java -jar spring까지 쓰고 tab키

--> 이게 안되면 java를 아무 곳에서 부를 수있게 환경변수 설정 or java 설치된 경로를 그 앞에 쓰고 java를 부르는 방법이 있다

압축 풀리면 sts-어쩌구 폴더가 생긴다

spring tool suite4

걍 이클립스 인터페이스넹

### lombok 라이브러리 

https://projectlombok.org/all-versions

power shell에서 java -jar lombok 하고 탭

install 창이 나오면 경로를 설정

경로- sts폴더의 exe 파일로 설정



create new Spring Starter 클릭

![image-20191223094054885](01springboot.assets/image-20191223094054885.png)



쓸 기술들을 지정

- Lombok
- Spring Data JPA
- H2 Database
- Thymeleaf
- Spring Web

빌드 툴 양대산맥

- gradle 

- mayven 

Java IDE 양대산맥

- eclipse
- Intellij



### controller 만들기

com.naxvinci.basic 패키지 내에 controller 패키지 하나 만들어주기

```java
package com.naxvinci.basic.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
	@GetMapping("/test")
	public String test() {
		return "Hello~";
	}
}

```

- shft + ctrl + o : 한꺼번에 import 단축키
- @RestController 와 @GetMapping 은 필수
- 실행하자
- @GetMapping("/test")에 쓴대로 http://localhost:8080/test 로 실행 후 확인가능



ctrl + f11 하기 전 콘솔 창 실행을 먼저 정지시켜주어야 한다





주석

- comment (`//`) 사람이 보기 위한 주석

- annotation(`@`) : 컴퓨터가 보기 위한 주석



```
package com.naxvinci.basic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Test2Controller {
	@GetMapping("/test2")
	public String test2() {
		return "hello";
	}
}
```

- 이 경우에는 hello라는 html 파일을 찾아가게됨



그냥 controller와 restcontroller의 차이

직접 찍을거냐

파일을 불러올거냐



### 이클립스 설정 변경하기

STS인코딩 설정 변경

- windows - preferences - encoding 검색 - workspace~ 
- ![image-20191223104521883](01springboot.assets/image-20191223104521883.png)

- content types 를 제외한 모든 부분에서 utf-8로 설정



### Log 사용하기

로그를 찍는 두가지 방식

- 롬복을 사용할 것인지

- 로거로직접 명시 할 것인지



syso로 나올 것을 파일로 저장한다

로거 라이브러리를 쓰면 

- syso보다 출력속도가 훨씬 빠르다

- 파일 등을 이용하여 로그를 관리하기가 수월하다
- 성능 좋다능



롬복이랑 slf4j는 우왕굳 



로그가 그래서 뭘까...

- 실행 기록이라고 한다



#### 로거로 찍기

기존에는 info부터 보였는데 

```java
logger.trace("trace!");
logger.debug("debug!");  //여기까지는 개발단계에서 확인용
logger.info("info!");    // 운용 상 필요한 정보
logger.warn("warning!"); //메모리 문제 등 경고 -동작이 되긴 되는데 위태위태하다
logger.error("error!");  // 치명적 오류 - 동작이 안된다. 문제다 
```



application.properties 파일에 

```java
# log level
logging.level.com.ggoreb.basic=trace
```

이걸 찍으면 trace부터 다 보인다

#### 롬복으로 찍기

???



서버재가동 없이 어쩌구 하기

build.gradle 파일 내에 



우클릭 - gradle- refresh

반영해주어야함



### 응답처리

서버에서 주는 응답이 여러개다

클라이언트가 요청한 것에 대해 응답을 해주는 형태





