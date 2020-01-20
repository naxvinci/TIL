# 정규표현식

> Regular Expressions = > 변수명으로 rex라는 약자를 많이 사용한다
>
> 편하려고 만들었다. 유효성 검사(validation)를 하기 위해 활용한다... 일 할 때 그 때 그 때 검색해서 찾아도 충분함

### 기호

`^` : 시작을 의미

`$`: 종료를 의미

`[]`: 부정을 의미

`+` : 하나 이상 뭐라도 들어와야 한다

`.`: 뭐든지 다 

`*`: 들어오든 안들어오든

`[xz]$`: x또는z로 끝나야 한다 

`|` : or 이란 의미

`()` -정규식 그룹화. .group(1)을 뽑으면 첫번째 그룹이 뽑힌다

`[.]`- 점 자체를 의미

[^abc] - a 또는 b 또는 c가 아닌 문자 (대괄호 내 꺾쇠는 부정을 의미)



### 정규표현식 관련 메소드

#### match()

> 문자열의 처음부터 정규식과 매치되는지 확인

칼같이..!



#### search()

> 좀 더 부드럽고 유연한 느낌~ 문자열 전체를 검색하여 매치되는지 확인

- 앞뒤로 뭐가 있든 상관 없다. 쭉 탐색을 하다가 내가 원하는 정규식과 매치하는 경우 매치된다고 판단한다
- 한글과 함께 있는 전화번호, 이메일 찾아내기 등 문서 중간에 포함된 내용을 찾아 낼 때 사용한다



#### findall()

> 그룹되어있는 녀석 형태와 매치하는 모든 문자열을 리스트로 만들어준다

- 이름들 찾아내기..!
- 그룹이 여러개면 어떻게 되려나?

#### finditer()

> 쓰기불편... 매치되는 모든 문자열을 iterator객체로 반환

- 이 자체로 사용하긴 좀 그래...

  ```python
  import re
  text = '1번 a@a.com 2번 b@b.org 3번 c@c.net'
  regex = '\w+@\w+[.](com|net)'
  pattern = re.compile(regex)
  it = pattern.finditer(text)
  for i in it:
      print(i.group())
  ```

  - 괄호로 감싸진 녀석들에 한해서 or 연산을 한다는 의미 (finditer()에서만 적용)



### sub

매칭되는 문자열 바꾸기

- 특정 문자열을 찾은 후 원하는 문자열로 변경 
- 변경 횟수 지정
- 지정부분 제외 후 문자열 변경 - 남겨 놓고 싶은 부분 괄호로 감싸준다

```python
import re
user_list = ['ggoreb@naver.com', 'seorab@gmail.com', 'human@ggoreb.com']
regex = '(\w+@)\w+([.]com)'
pattern = re.compile(regex)
change = '\g<1>*****\g<2>'
for user in user_list:
    res = pattern.sub(change, user)
    print(res)
```

- 남겨놓고 싶은 부분 괄호로 감싸준 후 sub(a,b)에서 a부분에 `\g<n>`의 형태로 넣어준다