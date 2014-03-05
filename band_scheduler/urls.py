from django.conf.urls import patterns, url

from band_scheduler import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^createSchedule$', views.createSchedule, name='createSchedule')
)