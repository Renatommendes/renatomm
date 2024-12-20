# mapapp/views.py
from django.shortcuts import render
import requests
from math import radians, sin, cos, sqrt, atan2
from django.shortcuts import render
from .models import Marker


def map_view(request):
    markers = Marker.objects.all()
    return render(request, 'mapapp/map.html', {
        'markers': markers,
        'api_key': 'AIzaSyCKyeLfN3GjEiDsYafdQGymklU-7VcKC6I',
    })