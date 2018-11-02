from django.db import models

# Create your models here.
class User(models.Model):
    tel = models.CharField(max_length=80,unique=True)
    password = models.CharField(max_length=256)
    token = models.CharField(max_length=256,default='')
    headimg = models.CharField(max_length=100,default='img/atom.png')

class Baner(models.Model):
    img = models.CharField(max_length=100)
    title = models.CharField(max_length=100)
    backcolor = models.CharField(max_length=100)
    trackid = models.CharField(max_length=20)

class Mrb(models.Model):
    img = models.CharField(max_length=100)
    trackid = models.CharField(max_length=20)

class Drb(models.Model):
    mane = models.CharField(max_length=100)
    tits = models.CharField(max_length=100)
    price1 = models.CharField(max_length=20)
    price2 = models.CharField(max_length=20)
    img = models.CharField(max_length=100)
    trackid = models.CharField(max_length=20)
