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
class Goods(models.Model):
    title = models.CharField(max_length=100)
    desc = models.CharField(max_length=100)
    bprice = models.CharField(max_length=30)
    mprice = models.CharField(max_length=30)
    trackid = models.CharField(max_length=50)
    num = models.CharField(max_length=30)
    size = models.CharField(max_length=100)
    img1 = models.CharField(max_length=100)
    img2 = models.CharField(max_length=100)
    img3 = models.CharField(max_length=100)
    img4 = models.CharField(max_length=100)
    img5 = models.CharField(max_length=100)
    kuaj = models.BooleanField(default=False)
class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(Goods)
    number = models.IntegerField()
    isselect = models.BooleanField(default=True)
    class Meta:
        db_table = 'babaifang_cart'

