from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse

from band_scheduler.models import Band, Schedule

# Create your views here.
def index(request):
    band_list = Band.objects.all().order_by('day', 'name')
    bands = bandsByDay(band_list)
    context = {'bands': bands}
    if request.user.is_authenticated():
        try:
            user_bands = Schedule.objects.get(user=request.user).bands.all()
        except Schedule.DoesNotExist:
            user_bands = []
        context['user_bands'] = user_bands
        return render(request, 'band_scheduler/index_auth.html', context)
    else:
        return render(request, 'band_scheduler/index.html', context)

def createSchedule(request):
    band_ids = request.POST.getlist('bands')
    bands = [Band.objects.get(pk=band_id) for band_id in band_ids]
    try:
        schedule = Schedule.objects.get(user=request.user)
        schedule.bands.clear()
    except Schedule.DoesNotExist:
        schedule = Schedule(user=request.user)
    schedule.save()
    schedule.bands.add(*bands)
    return HttpResponseRedirect(reverse('bands:mySchedule'))

def mySchedule(request):
    user = request.user
    context = {}
    if user.is_authenticated():
        try:
            bands = Schedule.objects.get(user=user).bands.all().order_by('day', 'name')
            context['bands'] = bandsByDay(bands)
        except Schedule.DoesNotExist:
            pass
    else:
        context = {'no_user': True}
    return render(request, 'band_scheduler/my-schedule.html', context)

def bandsByDay(band_list):
    bands_list = []
    for day in Band.DAY_CHOICES:
        i = 0
        limit = len(band_list)
        while i < limit and band_list[i].day == day[0]: i += 1
        bands_list.append(band_list[:i])
        band_list = band_list[i:]
    return bands_list