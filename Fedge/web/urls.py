from . import views
from django.conf.urls import include
from rest_framework import routers
from django.urls import path, re_path
from .views import Test_json


from .viewsets.cabinetanddoor import CabinetViewset, DoorViewset
from .viewsets.moduleviewsets import ContainerViewset
from .viewsets.requestviewsets import RequestViewset, Pyhonapp
from .viewsets.pythonapp import MqttMiddleware

router = routers.DefaultRouter()
router.register(r'userprofile', views.UserProfileViewset)
router.register(r'users', views.UserViewset)
router.register(r'cabinet', CabinetViewset)
router.register(r'doors', DoorViewset)
router.register(r'json', views.JasonViewset)
router.register(r'groupshift', views.ShiftOfGroupViewset)
router.register(r'shifts', views.ShiftsViewset)
router.register(r'containers', ContainerViewset)
router.register(r'requests', RequestViewset)
router.register(r'MqttMiddleware', MqttMiddleware)

urlpatterns = [
    # path('', views.home, name='web-home'),
    # path('update/', views.update, name='update'),
    # path ('access_check/', views.access_check, name='access_check'),
    # path ('door_status/', views.door_status, name='door_status'),
    # path ('unlocking/', views.unlocking, name='unlocking'),
    re_path(r'^', include(router.urls)),
    path('print_request/', views.CommandViewset, name='print_request'),
    path('authenticate/', views.CustomObtainAuthToken.as_view()),
    path('updatejson/', views.Test_json, name='updatejson'),
    path('temp_sensors_msg/', views.temp_sensors_msg, name='temp_sensors_msg'),
]