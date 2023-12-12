from . import views
from django.conf.urls import include
from rest_framework import routers
from django.urls import path, re_path




from .viewsets.cabinetanddoor import CabinetViewset, DoorViewset
from .viewsets.moduleviewsets import ContainerViewset
from .viewsets.requestviewset import RequestViewset
from .viewsets.pythonapp import MqttMiddleware
from .viewsets.testsome import test_access
from .viewsets.monitoring import Monitoring

router = routers.DefaultRouter()
router.register(r'userprofile', views.UserProfileViewset)
router.register(r'users', views.UserViewset)
router.register(r'cabinet', CabinetViewset)
router.register(r'doors', DoorViewset)
router.register(r'employeegroup', views.EmployeeGroupViewset)
router.register(r'shifts', views.ShiftsViewset)
router.register(r'containers', ContainerViewset)
router.register(r'requests', RequestViewset)
router.register(r'mqttmiddleware', MqttMiddleware)
router.register(r'test_access', test_access)
router.register(r'monitoring', Monitoring)

urlpatterns = [
    # path('', views.home, name='web-home'),
    # path('update/', views.update, name='update'),
    # path ('access_check/', views.access_check, name='access_check'),
    # path ('door_status/', views.door_status, name='door_status'),
    # path ('unlocking/', views.unlocking, name='unlocking'),
    re_path(r'^', include(router.urls)),
    path('authenticate/', views.CustomObtainAuthToken.as_view())
]