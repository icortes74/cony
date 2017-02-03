from django.contrib import admin
from .models import Alumno,Profesor,Clase,Plan
# Register your models here.

admin.site.register(Alumno)
admin.site.register(Profesor)
admin.site.register(Clase)
admin.site.register(Plan)