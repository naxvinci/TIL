# django 소개

### 프로젝트와 앱 만들기 기본 틀

1. 프로젝트 생성 및 구조 확인

   ` django-admin startproject mysite`

2. 앱 만들기- 생성한 프로젝트 폴더 내에 들어가서 실행

   ` python manage.py startapp polls`

3. cmd 창에서 바로 vscode 열기

   `code . `

4. runserver - 뒤에 숫자로 서버의 호스팅 주소를 바꿀 수 있다

   `python manage.py runserver`

5. 





### DB 연결하기

#### settings.py 수정하기

데이터베이스를 다루기 위해서는 setting.py의 INSTALLED_APPS에 꼭 추가해줘야 한다



DATABASES 역시 mysql에 맞게 바꿔줘야 한다

```python
DATABASES = {
 'default': {
 'ENGINE': 'django.db.backends.mysql',
 'NAME': 'django',
 'USER': 'root',
 'PASSWORD': '1234',
 'HOST': 'localhost',
 'PORT': 3306
 }
}
```



#### 이관하기

`python manage.py makemigrations` 를 통해 변경사항 등록



`python manage.py migrate`를 통해 이관



#### 외래키 지정하기

```python
class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')
class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
```





views- controller 역할. 사용자의 입력을 받아 출력하는 역할

여기 들어갈 수 있는 url 생성 필요

urls - 프로젝트에 url 만들면 다른거 신경쓸 필요 없지만

앱에 url 만들면 얘네는 routing 역할을 함

하나의 회선이 들어오면 여러 곳으로 분배 해주는 역할...



### django와 DB 연결하는 방법 세가지

1. django의 모델 기능을 활용하지 않고 pypysql 모듈을 활용

2. django의 모델 기능을 활용하는데 기존 테이블명과 컬럼명을 수정

   - 기존의 테이블 이름을 바꿔치기한다는 것

   - 모델에 만들어 둔 걸 데이터베이스에 저장하기

     model.py에 class로 만든 것이 들어간다

     하지만 이름이 특이하다. firstapp_collection 처럼 collection이라는 이름으로 클래스를 만들었는데 다르게 들어간다. 

1. django의 모델 기능을 활용하는데 기존 데이터를 새로 생성된 모델로 이관(migrate) 



### 데이터베이스 관련 API 테스트

- shell 접속 : python manage.py shell
- 모델(Choice, Question) import : from polls.models import *
-  Question 테이블 데이터 조회 : Question.objects.all()



#### 데이터 입력, 수정하기

ORM 방식 - 오브젝트와 모델을 연결시켜주는 것

클래스와 데이터베이스를 연결해주는 기술을 의미

```shell
In [4]: from django.utils import timezone

In [5]: q = Question(question_text="What's new>", pub_date = timezone.now())

In [6]: q.save()

In [7]: q.question_text = "What's Up?"

In [8]: q.save()

In [9]: 
```

- ORM의 특징 : 조회하는 순간 계속 연결되어 있음. 그래서 함부로 수정하면 안된다. 아래처럼 바뀜

```python
In [9]: Question.objects.all()[0].question_text
Out[9]: "What's Up?"

In [10]: data = Question.objects.get(pk=1)

In [11]: data.question_text = data.question_text + '?'

In [12]: data.save()
```

- ORM 방식은 항상 모든 것을 객체로 생각한다. . 객체로 가져와서 알아서 데이터를 집어 넣는다

```shell
In [13]: q
Out[13]: <Question: Question object (1)>

In [14]: q.choice_set.create(choice_text='Not Much', votes=0)
Out[14]: <Choice: Choice object (1)>
In [16]: Choice(choice_text='The Sky', votes=0, question=q).save()
```

단, 통계나 복잡한 쿼리 문장을 만들어 내는 것은 불가능하다.



#### shell 에서 바로 조회해보기

```shell
In [9]: Question.objects.all()[0].question_text
```

#### 관리자페이지 만들기(관리자계정)





#### rest방식으로 주소창에



#### 데이터 조회해서 웹에 출력

views.py에 

```python
from .models import Question

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:10] # 이건 진짜 리스트가 아니라서
    output = ', '.join([q.question_text for q in latest_question_list]) #하나씩 끄집어 내서 리스트 형태로 만들기
    return HttpResponse(output)
```



### 템플릿 활용

url 링크 연결하는 두가지 방식

```html
{% for question in latest_question_list %}
    <!-- <a href='/polls/{{question.id}}'> -->
    <a href='{% url "detail" question.id %}'> <!-- urls.py 내의 name을 통해 접근하는 방식-->
        <p>{{ question.question_text}}</p>
    </a>
{% endfor %}
```



url.py 통해서 views.py까지.



csrf -  cross site request forgery

post 방식으로 form 태그 넣어주면 오류

403 - 권한이 없다는 것

 csrf 토큰 코드 넣어주면 된다



데이터랑 웹 연결과정

```python
def results(request, question_id): # 투표 결과 페이지
    question = Question.objects.get(pk=question_id) # models.py에서 이거 자체가 객체로 지정되어 있기 때문에
    choices = question.choice_set.all()
    choices = Choice.objects.filter(question=question) # 이건 뭔 방식이지 근데 위와 같은 방식이라고 한다

    return render(request, 'polls/results.html', {'choices': choices})
```



#### css 적용하기

```html
{% load static %}
<link rel="stylesheet" href="{% static 'polls/style.css' %}">
```



