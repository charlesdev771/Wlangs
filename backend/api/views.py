from rest_framework import viewsets
from .models import Words
from .serializers import WordSerializer

# Create your views here.


class WordViewSet(viewsets.ModelViewSet):

    queryset = Words.objects.all()
    serializer_class = WordSerializer
