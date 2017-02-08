from django.contrib import admin
from .models import alumno,Profesor,Clase,Plan
# Register your models here.

admin.site.register(alumno)
admin.site.register(Profesor)
admin.site.register(Clase)
admin.site.register(Plan)