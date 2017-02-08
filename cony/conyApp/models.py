from __future__ import unicode_literals
import base64

from django.db import models

class alumno(models.Model):
	rut = models.IntegerField(primary_key=True,verbose_name='RUT')
	nombre = models.CharField(max_length=80)
	fecha_nac = models.DateField(verbose_name='Fecha Nacimiento')
	observaciones = models.TextField(max_length=500,blank=True)
	foto = models.TextField(blank=True,db_column='foto')
	telefono = models.IntegerField()
	correo = models.EmailField(max_length=80)

	class Meta:
		db_table = 'alumno'
		verbose_name_plural = 'Alumnos'

class Plan(models.Model):
	"""docstring for Plan"""
	id = models.IntegerField(primary_key=True)
	nombre = models.CharField(max_length=80)
	duracion = models.IntegerField(null=True)
	clases = models.IntegerField(null=True)
	estado = models.CharField(max_length=80)

	class Meta:
		db_table = 'plan'
		verbose_name_plural = 'Planes'

class Profesor(models.Model):
	rut = models.IntegerField(primary_key=True,verbose_name='RUT')
	nombre = models.CharField(max_length=80)
	fecha_nac = models.DateField(verbose_name='Fecha Nacimiento')
	observaciones = models.TextField(max_length=500,blank=True)
	foto = models.TextField(blank=True,db_column='foto')
	telefono = models.IntegerField()
	correo = models.EmailField(max_length=80)

	class Meta:
		db_table = 'profesor'
		verbose_name_plural = 'Profesores'

class Clase(models.Model):
	id = models.IntegerField(primary_key=True)
	dia = models.IntegerField()
	hora = models.TimeField()
	profesor = models.ForeignKey(Profesor,on_delete=models.DO_NOTHING)
	fecha_inicio = models.DateField(verbose_name='Fecha Inicio')
	fecha_fin = models.DateField(verbose_name='Fecha Fin')

	class Meta:
		db_table = 'clase'
		verbose_name_plural = 'Clases'

class Asistencia(models.Model):
	id = models.IntegerField(primary_key=True)
	fecha = models.DateField()
	almuno = models.ForeignKey(alumno,on_delete=models.DO_NOTHING)

	class Meta:
		db_table = 'asistencia'

class ClaseIns(models.Model):
	id = models.IntegerField(primary_key=True)
	fecha = models.DateField(auto_now_add=True)
	profesor = models.ForeignKey(Profesor,on_delete=models.DO_NOTHING)
	observaciones = models.TextField(max_length=500,blank=True)

	class Meta:
		db_table = 'clase-ins'

class PlanIns(models.Model):
	id = models.IntegerField(primary_key=True)
	almuno = models.ForeignKey(alumno,on_delete=models.DO_NOTHING)
	plan = models.ForeignKey(Plan,on_delete=models.DO_NOTHING)
	fecha_ingreso=models.DateField()
	fecha_inicio=models.DateField()
	fecha_fin=models.DateField()

	class Meta:
		db_table = 'plan-ins'