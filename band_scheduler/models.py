from django.db import models
from django.conf import settings

# Create your models here.
class Band(models.Model):
    # days
    DAY_1 = '1'
    DAY_2 = '2'
    DAY_3 = '3'
    DAY_CHOICES = [
        (DAY_1, '1'),
        (DAY_2, '2'),
        (DAY_3, '3')
    ]

    # stages
    COACHELLA_STAGE =   'coachella'
    OUTDOOR_STAGE =     'outdoor'
    GOBI_STAGE =        'gobi'
    MOJAVE_STAGE =      'mojave'
    SAHARA_STAGE =      'sahara'
    STAGE_CHOICES = [
        (COACHELLA_STAGE, 'Coachella Stage'),
        (OUTDOOR_STAGE, 'Outdoor Theatre'),
        (GOBI_STAGE, 'Gobi Tent'),
        (MOJAVE_STAGE, 'Mojave Tent'),
        (SAHARA_STAGE, 'Sahara Tent')
    ]

    name =          models.CharField(max_length = 100)
    day =           models.CharField(max_length = 1, choices = DAY_CHOICES)
    start_time =    models.TimeField()
    end_time =      models.TimeField()
    stage =         models.CharField(max_length = 20, choices = STAGE_CHOICES)

class Schedule(models.Model):
    user =  models.ForeignKey(settings.AUTH_USER_MODEL)
    bands = models.ManyToManyField(Band)