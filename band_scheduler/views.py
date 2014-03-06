from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse

from band_scheduler.models import Band, Schedule

# Create your views here.
def index(request):
    band_list = Band.objects.all().order_by('day', 'name')
    bands = []
    day = band_list[0].day
    start = 0
    for idx, band in enumerate(band_list):
        if band.day != day:
            bands.append(band_list[start:idx])
            day = band.day
            start = idx
    bands.append(band_list[start:])
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
    return HttpResponseRedirect(reverse('bands:index'))