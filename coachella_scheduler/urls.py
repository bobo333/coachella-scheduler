from django.conf.urls import patterns, include, url
from django.contrib.auth.views import login, logout
from django.conf import settings

from coachella_scheduler.views import register

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'coachella_scheduler.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^login$', login, {'template_name': 'registration/login.html'}, name='login'),
    url(r'^logout$', logout, {'next_page':  settings.LOGOUT_REDIRECT_URL}, name='logout'),
    url(r'^register$', register, name='register'),
    url(r'^bands/', include('band_scheduler.urls', namespace='bands')),
    url(r'^$', 'coachella_scheduler.views.home', name="home")
)
