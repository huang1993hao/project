from django.db import models

# Create your models here.
class User(models.Model):
    tel = models.CharField(max_length=80,unique=True)
    password = models.CharField(max_length=256)
    token = models.CharField(max_length=256,default='')
    headimg = models.CharField(max_length=100,default='img/atom.png')
