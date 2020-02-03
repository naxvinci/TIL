# 모델

모델에 있는 속성은 반드시 데이터베이스에도 존재해야 한다



컬럼의 자료 타입이라는게 있다

이런거랑 비슷하게 필드가 있음

필드에는 옵션이라는 것도 있고

migrate를 할 때 가끔 default 값이 없다고 오류가 나는 경우가 있다. (왜인지는 모름) 



던더스코어 - 이런걸 포함/ 시작/ 끝나는거 찾을 때 활용



```shell
In [1]: from polls.models import *

In [2]: Question.objects.all()
Out[2]: <QuerySet [<Question: What's Up??>, <Question: Test>, <Question: 1>, <Question: d>]>

In [3]: Question.objects.filter(question_text__contains='s')
```



- 모델 관계

데이터베이스의 일대다 다대다 일대일 등의 관계가 model을 작성할 때 표기 되어야 한다. 



n대n은 동급이다. 누구를 기준으로 하든 상관 없지만 하나를 선택해야 한다. 표현하는 부분을 한 군데 정해야함. 그리고 누가 주인인가에 따라 ..



# 뷰 

화면에 뿌려주는 역할

뷰를 구현하는 2가지 방법 

만들어진 것을 가져오는 경우 - 쉽지만 규격이 정해져있다



`return HttpResponse('출력 문자열')`

테스트 용도로 간단하게 확인만 할 때 사용

`return render(request, '템플릿/HTML', 데이터객체)`

정식으로 웹사이트르 만들때 사용



프로젝트 단위의 url과 앱 단위의 url 분리해서 사용 가능하다

```
from django.urls import path
from [app] import views
urlpatterns = [
 path('접속주소/', views.함수명, name='이름'),
]

```



클래스 기반으로 뷰를 사용 할 때는 먼저 함수가 아니라 클래스 형태다. 제네릭 뷰의 다양한 종류를 상속 받아 사용하는 형태

```
class ShowView(generic.ListView):
 template_name = 'firstapp/show.html'
 context_object_name = 'list'
 def get_queryset(self):
 return Curriculum.objects.all()
```



클래스 기반으로 사용할 때는 반드시 as_view를 써줘야 한다

```
# Project/urls.py
from django.urls import path
urlpatterns = [
 path('show2/', views.ShowView.as_view(), name='showview_class'),
]
```



#### 제네릭 뷰

`form view` - 되게 좋은데.. 다양하게 활용 가능하지만 디자인을 적용하기에는 어렵다



# 템플릿

제어문

```
<h1>태그</h1>
{% if score > 60 %} 점수 : {{score}} / PASS
{% else %} 점수 : {{score}} / FAIL
{% endif %}
<ul>
{% for word in words %}
 <li>{{ word }}</li>
{% endfor %}
</ul>
```



파이프라인을 붙여주고 장고 기능을 써주면 앞의 것이 변화한다

```
<h1>필터</h1>
{{words.0|upper}}<br>
{{'GGOREB'|lower}}<br>
```

한줄 주석과 여러줄 주석

```
<h1>코멘트</h1>
{# 한줄 주석 #}
{% comment %}
 주석 처리된 코드
 html에서 보이지 않는 코드
{% endcomment %}
```



HTML 확장 

- 타임리프와 반대의 개념

- 공통으로 사용될 녀석이 한개. 바뀌어지는 핵심 내용들이 작게 작게 다 들어간다

