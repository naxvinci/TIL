from django.shortcuts import render
from django.http import HttpResponse
from .models import Question, Choice

def index(request):
    latest_question_list = Question.objects.order_by('-pub_date')[:10] # 이건 진짜 리스트가 아니라서
    output = ', '.join([q.question_text for q in latest_question_list]) #하나씩 끄집어 내서 리스트 형태로 만들기
    return render(request, 'polls/index.html', {'latest_question_list': latest_question_list}) # 중괄호에는 넘길만한게 있는 경우 딕셔너리 형태로 넣어줌
    # return HttpResponse(output)

def detail(request, question_id): # 질문 상세 페이지
    question = Question.objects.get(pk=question_id)
    return render(request, 'polls/detail.html', {'question': question})
    # return HttpResponse("You're looking at question %s." % question_id)

def results(request, question_id): # 투표 결과 페이지
    question = Question.objects.get(pk=question_id) # models.py에서 이거 자체가 객체로 지정되어 있기 때문에
    choices = question.choice_set.all()
    choices = Choice.objects.filter(question=question) # 이건 뭔 방식이지 근데 위와 같은 방식이라고 한다

    return render(request, 'polls/results.html', {'choices': choices})
    # response = "You're looking at the results of question %s."
    # return HttpResponse(response % question_id)
    
def vote(request, question_id): # 투표 페이지
    num = request.POST['choice'] # detail.html에서 라디오의 name으로 지정해둔 거임
    choice = Choice.objects.get(pk=num)
    vote = choice.votes + 1 # 투표수 1 증가
    choice.votes = vote
    choice.save()
    return HttpResponse("You're voting on question %s." % question_id)

def free(request):
    return render(request, 'polls/freelancer.html', {})

def addvote(rerequest, question_id): # 투표 페이지
    question = Question(question_text="인풋받는키")
    question.save()
    return render(request, 'polls/addvote.html', {'question': question})