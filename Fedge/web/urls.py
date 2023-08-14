from . import views
from django.conf.urls import include
from rest_framework import routers
from django.urls import path, re_path

router = routers.DefaultRouter()
router.register(r'userprofile', views.UserProfileViewset)
router.register(r'users', views.UserViewset)
# router.register(r'button',views.ButtonViewset)
router.register(r'cabinet', views.CabinetViewset)
router.register(r'doorsensor', views.CabinetViewset)
router.register(r'json', views.JasonViewset)
router.register(r'groupshift', views.ShiftOfGroupViewset)
router.register(r'shifts', views.ShiftsViewset)

urlpatterns = [
    # path('', views.home, name='web-home'),
    # path('update/', views.update, name='update'),
    # path ('access_check/', views.access_check, name='access_check'),
    # path ('door_status/', views.door_status, name='door_status'),
    # path ('unlocking/', views.unlocking, name='unlocking'),
    re_path(r'^', include(router.urls)),
    path('print_request/', views.CommandViewset, name='print_request'),
    path('authenticate/', views.CustomObtainAuthToken.as_view())
]
