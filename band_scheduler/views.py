from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User

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
            bands = getUserBands(user)
            context['bands'] = bandsByDay(bands)
        except Schedule.DoesNotExist:
            pass
    else:
        context = {'no_user': True}
    context['share_link'] = "%s/schedule/%s" % (request.get_host(), user.username)
    return render(request, 'band_scheduler/my-schedule.html', context)

def userSchedule(request, username):
    context = {
        'username': username
    }
    try:
        user = User.objects.get(username=username)
        bands = getUserBands(user)
        context['bands'] = bandsByDay(bands)
    except (User.DoesNotExist, Schedule.DoesNotExist):
        pass
    return render(request, 'band_scheduler/user-schedule.html', context)

def compareSchedules(request):
    usernames = request.GET.get('schedules').split(',')
    users = [request.user]
    user_bands = {}
    user_bands[request.user.username] = bandsByDay(getUserBands(request.user), True)

    # get each user's schedule
    for username in usernames:
        user = get_object_or_404(User, username=username)
        users.append(user)
        user_bands[username] = bandsByDay(getUserBands(user), True)
    bands_in_common = {}
    days = Band.DAY_CHOICES

    # find common bands by day
    for day in days:
        day = day[0]

        # filter for common bands amongst all users
        for user in users:
            name = user.username
            if day not in bands_in_common:
                bands_in_common[day] = set(user_bands[name][day])
            else:
                bands_in_common[day] = bands_in_common[day] & set(user_bands[name][day])

        # remove common bands from individual users
        for user in users:
            name = user.username
            user_bands[name][day] = list(set(user_bands[name][day]) - bands_in_common[day])

        # turn values into a list
        bands_in_common[day] = list(bands_in_common[day])

    context = {
        'users': users,
        'user_bands': user_bands,
        'bands_in_common': bands_in_common,
        'days': days
    }
    return render(request, 'band_scheduler/compare.html', context)

# helpers
def bandsByDay(band_list, dict_form=False):
    if dict_form:
        bands = {}
    else:
        bands = []
    for day in Band.DAY_CHOICES:
        i = 0
        limit = len(band_list)
        while i < limit and band_list[i].day == day[0]: i += 1
        if dict_form:
            bands[day[0]] = band_list[:i]
        else:
            bands.append(band_list[:i])
        band_list = band_list[i:]
    return bands

def getUserBands(user):
    return Schedule.objects.get(user=user).bands.all().order_by('day', 'name')