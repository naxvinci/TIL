# spring boot2



### 페이지 넘버 동적으로 작동하기

```java
package com.naxvinci.basic.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ThymeleafController {
	@GetMapping("/linkUrl")
	public String linkUrl(
//			@RequestParam int start,
//			@RequestParam int end,
			@RequestParam int now_page,
			Model model) {
		int start = (now_page - 1) / 10 * 10 + 1;
		int end = start + 9;
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		return "linkUrl";
	}
```

html

```html
<th:block th:each="page : ${#numbers.sequence(start,end)}">
	<a href="#">[[${page}]]</a>
</th:block>
```



now_page를 추가하기

```java
@Controller
public class ThymeleafController {
	@GetMapping("/linkUrl")
	public String linkUrl(
//			@RequestParam int start,
//			@RequestParam int end,
			@RequestParam int now_page,
			Model model) {
		int start = (now_page - 1) / 10 * 10 + 1;
		int end = start + 9;
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("now_page", now_page);
		return "linkUrl";
	}
```

- 이때 now_page는 필수값이다. 리퀘스트파람...
- 이걸 필수값으로 지정하고 싶지 않다면

```java
@RequestParam (defaultValue="1") int now_page
```

​		이런 식으로 `defaultValue`를 주면 된다. 



조건문 활용하기

```html
<th:block th:each="page : ${#numbers.sequence(start,end)}">
	<span th:if="${now_page == page}"
	th:text="${page}"></span>
	<a href="#" th:unless="${now_page == page}">[[${page}]]</a>
</th:block>
```



출력결과

![image-20191224110843858](02springboot.assets/image-20191224110843858.png)