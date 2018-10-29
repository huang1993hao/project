from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request,'index.html')


def cart(request):
    return render(request,'cart.html')


def login(request):
    return render(request,'login.html')


def product_details(request):
    return render(request,'product_details.html')


def register(request):
    return render(request,'register.html')