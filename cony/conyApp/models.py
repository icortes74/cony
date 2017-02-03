from __future__ import unicode_literals
import base64

from django.db import models

class Alumno(models.Model):
	rut = models.IntegerField(primary_key=True,verbose_name='RUT')
	nombre = models.CharField(max_length=80)
	fecha_nac = models.DateField(verbose_name='Fecha Nacimiento')
	observaciones = models.TextField(max_length=500,blank=True)
	foto = models.TextField(blank=True,db_column='foto')
	telefono = models.IntegerField(max_length=11)
	correo = models.EmailField(max_length=80)

	class Meta:
		db_table = 'alumno'

class Plan(models.Model):
	"""docstring for Plan"""
	id = models.IntegerField(primary_key=True)
	nombre = models.CharField(max_length=80)
	duracion = models.IntegerField(max_length=11,null=True)
	clases = models.IntegerField(max_length=11,null=True)
	estado = models.CharField(max_length=80)

	class Meta:
		db_table = 'plan'

class Profesor(models.Model):
	rut = models.IntegerField(primary_key=True,verbose_name='RUT')
	nombre = models.CharField(max_length=80)
	fecha_nac = models.DateField(verbose_name='Fecha Nacimiento')
	observaciones = models.TextField(max_length=500,blank=True)
	foto = models.TextField(blank=True,db_column='foto')
	telefono = models.IntegerField(max_length=11)
	correo = models.EmailField(max_length=80)

	class Meta:
		db_table = 'profesor'

class Clase(models.Model):
	id = models.IntegerField(primary_key=True)
	dia = models.IntegerField(max_length=2)
	hora = models.TimeField()
	profesor = models.ForeignKey(Profesor,on_delete=models.DO_NOTHING)
	fecha_inicio = models.DateField(verbose_name='Fecha Inicio')
	fecha_fin = models.DateField(verbose_name='Fecha Fin')

	class Meta:
		db_table = 'clase'

class Asistencia(models.Model):
	id = models.IntegerField(primary_key=True)
	fecha = models.DateField()
	almuno = models.ForeignKey(Alumno,on_delete=models.DO_NOTHING)

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
	almuno = models.ForeignKey(Alumno,on_delete=models.DO_NOTHING)
	plan = models.ForeignKey(Plan,on_delete=models.DO_NOTHING)
	fecha_ingreso=models.DateField()
	fecha_inicio=models.DateField()
	fecha_fin=models.DateField()

	class Meta:
		db_table = 'plan-ins'