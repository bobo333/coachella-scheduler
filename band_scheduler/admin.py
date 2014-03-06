from django.contrib import admin
from band_scheduler.models import Band, Schedule

# Register your models here.

class BandAdmin(admin.ModelAdmin):
    list_display = ('name', 'day', 'stage', 'start_time', 'end_time')
    list_filter = ('day', 'stage')
    search_fields = ('name',)

class ScheduleAdmin(admin.ModelAdmin):
    filter_horizontal = ('bands', )
    list_display = ('username', )

admin.site.register(Band, BandAdmin)
admin.site.register(Schedule, ScheduleAdmin)