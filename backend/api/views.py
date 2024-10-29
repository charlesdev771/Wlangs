from rest_framework import viewsets
from .models import Words
from .serializers import WordSerializer
#from rest_framework.permissions import IsAuthenticated
# Create your views here.


class WordViewSet(viewsets.ModelViewSet):

    queryset = Words.objects.all()
    serializer_class = WordSerializer
    #permission_classes = [IsAuthenticated]
