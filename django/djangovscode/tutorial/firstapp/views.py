from django.shortcuts import render
from django.http import HttpResponse
from firstapp.models import Curriculum, Shop

def index1(request):
    return HttpResponse('<h1> index1 </h1>')

def index2(request):
    return HttpResponse('<h1>Hi</h1>')

def main(request):
    list = Curriculum.objects.all()
    html = ''
    for cur in list:
        html+= cur.name + '<br>'

    return render(
        request, 'firstapp/main.html', {'list':list})

def shop(request):
    list = Shop.objects.all()
    return render(
        request, 'firstapp/shop.html', {'list': list}
    )
# Create your views here.
