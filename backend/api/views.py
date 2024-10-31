from rest_framework import viewsets
from .models import Word, Language
from .serializers import WordSerializer, LanguageSerializer
class WordViewSet(viewsets.ModelViewSet):
    
    serializer_class = WordSerializer
    queryset = Word.objects.all()
    
    def get_queryset(self):
        queryset = super().get_queryset()
        lang_origin = self.request.query_params.get('lang_origin')
        if lang_origin:
            queryset = queryset.filter(lang_origin=lang_origin)
        return queryset

class LanguageViewSet(viewsets.ModelViewSet):
    
    queryset = Word.objects.all()
    serializer_class = WordSerializer
