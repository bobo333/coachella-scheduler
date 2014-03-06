from django.shortcuts import render
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponseRedirect
from django.contrib.auth import authenticate, login

def register(request):
    if request.POST:
        form = UserCreationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
            print new_user.password
            print new_user.username
            auth_user = authenticate(username=new_user.username, password=form.clean_password2())
            print auth_user
            login(request, auth_user)
            return HttpResponseRedirect("/bands")
    else:
        form = UserCreationForm()
    return render(request, 'registration/register.html', {
        'form': form
    })