from django.urls import path
from . import views
from django.contrib.auth import views as auth_views


urlpatterns = [
    path('', views.home, name='web-home'),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(template_name='logout.html', next_page=None), name='logout'),
    path('update/', views.update, name='update'),
    path ('access_check/', views.access_check, name='access_check'),
    path ('door_status/', views.door_status, name='door_status'),
    path ('unlocking/', views.unlocking, name='unlocking'),
]