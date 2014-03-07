from django.conf.urls import patterns, url

from band_scheduler import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^create-schedule$', views.createSchedule, name='createSchedule'),
    url(r'^schedule/?$', views.mySchedule, name='mySchedule'),
    url(r'^schedule/(?P<username>[^/^\s]+)/$', views.userSchedule, name='userSchedule')
)