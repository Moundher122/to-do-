from django.urls import path
from . import views

urlpatterns = [
    path('', views.getdata, name='get_notes'),
    path('note/<str:id>/',views.getdat,name='note'),
    path('create/',views.create_note),
    path('<str:pk>/update/',views.updatenote),
    path('<str:pk>/delete',views.deletenote),
]
