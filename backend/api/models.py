from django.db import models

class Language(models.Model):
    name = models.CharField(max_length=50)
    code = models.PositiveIntegerField(unique=True)  # Representa o código numérico do idioma

    def __str__(self):
        return self.name

class Word(models.Model):
    word = models.CharField(max_length=50)
    translation = models.CharField(max_length=50, null=True, blank=True)  # Permitir nulo e em branco
    lang_origin = models.IntegerField()

    def __str__(self):
        return self.word
