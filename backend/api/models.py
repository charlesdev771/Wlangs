from django.db import models

class Words(models.Model):
    
    word = models.CharField(max_length=50)
    lang_origin = models.IntegerField() #1 = english, 2 = spanish, 3 = italian


    def __str__(self):
        
        return self.word    