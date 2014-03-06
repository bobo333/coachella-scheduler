from django.shortcuts import render

from band_scheduler.models import Band

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
        return render(request, 'band_scheduler/index_auth.html', context)
    else:
        return render(request, 'band_scheduler/index.html', context)

def createSchedule(request):
    print request.POST
    print request.POST.getlist('bands')