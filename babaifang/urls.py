from django.conf.urls import url

from babaifang import views

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^cart/$',views.cart,name='cart'),
    url(r'^login/$',views.login,name='login'),
    url(r'^product_details/(\d+)/$',views.product_details,name='product_details'),
    url(r'^register/$',views.register,name='register'),
    url(r'^logout/$',views.logout,name='logout'),
    url(r'^uploadhead/$',views.uploadhead,name='uploadhead'),
    url(r'^checkmobile/$',views.checkmobile,name='checkmobile'),
    url(r'^addcart/$',views.addcart,name='addcart'),
    url(r'^addcount/$',views.addcount,name='addcount'),
    url(r'^subcount/$',views.subcount,name='subcount'),
    url(r'^changecheck/$',views.changecheck,name='changecheck'),
    url(r'^changeallcheck/$',views.changeallcheck,name='changeallcheck'),
    url(r'^clearCart1/$',views.clearCart1,name='clearCart1'),
    url(r'^clearCarts/$',views.clearCarts,name='clearCarts'),
    url(r'^generateorder/$',views.generateorder,name='generateorder'),
    url(r'^orderinfo/(\d+)/$',views.orderinfo,name='orderinfo'),
]