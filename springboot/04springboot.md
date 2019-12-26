# springboot 

h2데이터베이스의 최대 장점 - 언제 어디서든 접속해서 데이터를 열어볼 수 있다. 서버의 역할을 한다넹. 관련 해서 오라클사가 유명하다. 관련 자격증으로는 OCP가 있다. 자격증 시험 응시비는 50 , 교육 받는데엔 100 정도 ... 드는 아주 비싼 자격증

다루기 위해서는 전문적인 지식이 필요하닥. 이 때 이걸 최소화하기 위해서 JPA가 도움이 되는 것~~

AOP filter 등 개념을 이해하는 정도로도 괜찮다. 



#### sts에서 폴더 import하는 법 세가지

1. `General - existing project - archive file- 압축폴더 선택` : 뭔가 투머치 잡다한게 같이 불린다? 이걸로 import
2. `Git - projects from git`
3. `Gradle -existing Gradle..` : import했는데 뭔가 부족하거나 없다? 이걸로 import하자



`shift + ctrl + R` = 파일열기



### 레파지토리와 컨트롤러의 연결

자식은 언제든지 부모가 될 수 있고 부모의 모든 특성을 물려받을 수 있다. 

```java
@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}
```

- 제네릭 형태 
- JPA는 데이터베이스를 다뤄주는 역할을 한다.
- product라는 table을 참조하겠다. long은 id를 의미
- 세상에 완전히 동일한 것은 없다. 모든 것들은 고유한 값(id)가 있어야한다. like 주민등록번호
- 이 레파지토리가 product에 접근할건데 id는 long이다~

이 레파지토리를 가져올 때는

```java
@Autowired
ProductRepository productRepository;
```

- 이런식으로한다. 이걸로 연결이 가능하다구? 신기하다. 이게 가능한 걸 두고 IoC/DI라고 부른다.
- `@Autowired` : 스프링이 존재를 알고 있는 것이라면 뭐든 가져올 수 있다. 이거 완전 깡패임
- `@ Controller` `@Service` `@Repository` `@Component` 는 스프링이 구동되면서 바로 메모리에 올려버리는 녀석덜이다. 스프링이 구동되면서 바로 안다. 
- 하지만 `@Data` 등 모든 어노테이션을 다 아는건 아님
- IoC : 관리를 스프링이 알아서 하고 
- DI : 알아서 끌어다가 나한테 주입시키는게 가능



가장 중요한 메소드 둘 = 조회(find), 입력(save)



```java
Product pro = productRepository.save(product);
log.error(pro.toString());
```

- log.error는 string만 받는데 내가 product를 넣으려하면 에러난다. 이를 위해 toString을 사용해서 변환



h2내에서 등록한 데이터들은 user-student 내에 test.mv.db 파일에 등록된 것이다. 이거 지우면 다 지워진다. 다른 사람에게 전달할 때 이것만 전달하면 됨

데이터베이스의 장점 = 컴터 한대에 설치해놓고 여러사람이 동시에 접속가능. 

근데 h2가 스프링 구동 시에 데이터베이스가 안된다! 

이걸 해결하려면 embedded를 server로 바꾼다. Url이 바뀔 것이다. 그럼 그거 복사해서



TMI : 우리나라에서 가장 유명한 JPA책- 배달의민족 쩌구 팀장이 써서 몇억 벌었대

---

### File Upload

업로드컨트롤러를 만들어서 사용자의 요청을 받는 리퀘스트파람, 모델어트리븃 같은 걸 쓰는데 `MultipartHttpServletRequest`를 활용한다.



사용자가 파일 첨부해서 넘겨줄 때 필요한 것이 바로 HTML

무조건 `enctype="multipart/form-data"` 라고 인코딩 타입을 지정해줘야 한다. 틀리면 안돼



요건 옵션

```java
# file upload
spring.servlet.multipart.max-file-size=2097152
spring.servlet.multipart.max-request-size=2097152
```

- 위는 한개당 파일 최대 크기 지정
- 한 번 올릴 때(request 당) 넣을 수 있는 최대 크기



```java
@PostMapping("/upload1")
@ResponseBody
public String upload1Post(MultipartHttpServletRequest mRequest) {
String result = "";
		
//		 업로드 된 파일 정보
MultipartFile mFile = mRequest.getFile("file");
String oName = mFile.getOriginalFilename();
// 		지정 경로에 지정 파일명으로 저장
try {
	mFile.transferTo( new File("c:/dev/" + oName));
	} catch (IllegalStateException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	result += oName + "\n";
	return result;
}
```

- "file"은 upload1.html에서 지정한 명칭임
- 파일을 저장할 위치 지정
- File을 import한다
- try catch로 지정
- 업로드를 누르면 지정한 위치로 파일이 저장된다



여러개 올리게 하기

```java
public class UploadController {
	@GetMapping("/upload1")
	public String upload1() {
		return "upload1";
	}

	@PostMapping("/upload1")
	@ResponseBody
	public String upload1Post(MultipartHttpServletRequest mRequest) {
		String result = "";

		List<MultipartFile> mFiles = mRequest.getFiles("file");
		for (int i = 0; i < mFiles.size(); i++) {
			mFiles.get(i);

			// 업로드 된 파일 정보
			MultipartFile mFile = mFiles.get(i);
			String oName = mFile.getOriginalFilename();
			result += oName + "\n";
			// 지정 경로에 지정 파일명으로 저장
			try {
				mFile.transferTo(new File("c:/dev/" + oName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return result;
	}
```

- result += oName + "\n"; 는 result에 result와 oName을 더한 값을 넣으라는 것이당

