from rest_framework import serializers
from .models import Language, Word

class LanguageSerializer(serializers.ModelSerializer):
    class Meta:
        
        model = Language
        fields = ['id', 'name', 'code']


class WordSerializer(serializers.ModelSerializer):
    class Meta:
        
        model = Word
        fields = ['id', 'word', 'translation', 'lang_origin']# lang_origin é o `id` do idioma
