from django.urls import path
from .views import WordViewSet, LanguageViewSet

urlpatterns = [
    # Endpoints para Language
    path('languages/', LanguageViewSet.as_view({'get': 'list'}), name='language-list'),
    path('language/<int:pk>/', LanguageViewSet.as_view({'get': 'retrieve'}), name='language-detail'),

    # Endpoints para Word
    path('words/', WordViewSet.as_view({'get': 'list', 'post': 'create'}), name='word-list'),
    path('word/<int:pk>/', WordViewSet.as_view({'get': 'retrieve', 'put': 'update', 'delete': 'destroy'}), name='word-detail'),
]
