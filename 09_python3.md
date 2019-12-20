# 파이썬 기초 3

- 파이썬이 구동하는 과정을 시각적으로 볼 수 있는 사이트

http://pythontutor.com/

http://pythontutor.com/java.html#mode=display

## 텔레그램 챗봇만들기

### 1. 챗봇 계정 생성

- 텔레그램에서 `@bot_father`를 검색하고 시작한다.
- `/newbot`을 통해 새로운 봇을 생성
- 봇의 이름과 계정을 설정한다
- HTTP API에 접근 할 때 필요한 고유 토큰 번호를 발급 받을 수 있다

### 2.  Telegram Bot API

- Authorizing your bot - 토큰을 https://api.telegram.org/bot<token>/METHOD_NAME 에 넣고 메소드 네임에는 getMe를 넣는다.
- 다음으론 메소드 네임에 getUpgrades를 입력한다
- 나의 ID 번호를 찾는다. 

```
1035286412:AAHXKfV573pG_zvzVQ2_4k-uPGMbHP5XKhc <Token>

969310643 계정아이디
```

### 3. `.env` 파일을 만들어 아이디 등을 숨기기

- 토큰이나 아이디는 숨겨야 하니 .env 파일로 따로 관리.
- .env는 environment의 약자다.
- 파이썬의 모듈인 `decouple`의 `config`를 통해 숨겨준다



### 4. write과 read 파일을 통해 채팅메시지 보내기

requests 가 하는 일 - 정해진 url로 요청을 보내고 requests로 응답을 받는방식



$ pip freeze > requirements.txt



README.md에

pip install -r requirements.txt 라고 써두면 됨



200이라는 숫자 web에 요청 보냈을 때 제대로 성공했다는 의미



파이썬의 조건문 사용하기



webhook - ngrok

cmd 창에서 해당 flask 있는 폴더에 들어가서(cd)  mgrok http 5000 c친다



```shell
ngrok by @inconshreveable                                                                               (Ctrl+C to quit)                                                                                                                        Session Status                online                                                                                    Session Expires               7 hours, 59 minutes                                                                       Version                       2.3.35                                                                                    Region                        United States (us)                                                                        Web Interface                 http://127.0.0.1:4040                                                                     Forwarding                    http://4c241231.ngrok.io -> http://localhost:5000                                         Forwarding                    https://4c241231.ngrok.io -> http://localhost:5000                                                                                                                                                                Connections                   ttl     opn     rt1     rt5     p50     p90                                                                             0       0       0.00    0.00    0.00    0.00  
```

webhook을 통해 우리서버와 텔레그램 서버를 연동

로컬을 외보에서 접속할 수 있게 만들었다.

텔레그램 서버에서 받는 데이터를 내 서버도 받을 수 있게 해주는 역할 - 웹훅



```shell
{'update_id': 195064093, 
	'message': {
				'message_id': 9, 
				'from': {
							'id': 969310643, 
							'is_bot': False, 
							'first_name': 'Naeun', 
							'last_name': 'Park', 
							'language_code': 'ko'
							}, 
				'chat': {
							'id': 969310643, 										'first_name': 'Naeun', 
							'last_name': 'Park', 
							'type': 'private'
							}, 
				'date': 1576818779, 
				'text': '안녕'
			}
		}
```



네이티브 앱 키

b6d07f6eae9669dea31acb6068d03b3e

REST API 키

9780e5166fd074a72029f6d121fc664b

JavaScript 키

031787e6b5e768de92894d19f7b9ca9b

Admin 키

a80c5736d3735b2710897a8cac8fb619



URL("https://kapi.kakao.com/v1/translation/translate?src_lang=kr&target_lang=en&query="

GET /v1/translation/translate HTTP/1.1

Host: kapi.kakao.com

Authorization: KakaoAK b6d07f6eae9669dea31acb6068d03b3e









https://www.pythonanywhere.com/