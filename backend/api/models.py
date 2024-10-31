from django.db import models

class Language(models.Model):
    name = models.CharField(max_length=50)
    code = models.PositiveIntegerField(unique=True)

    def __str__(self):
        return self.name

class Word(models.Model):
    word = models.CharField(max_length=50)
    translation = models.CharField(max_length=50, null=True, blank=True)
    lang_origin = models.IntegerField()

    def __str__(self):
        return self.word
