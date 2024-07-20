from rest_framework import viewsets, filters
from .models import Item
from .serializers import ItemSerializer
from django_filters.rest_framework import DjangoFilterBackend

from rest_framework.authentication import BasicAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated

class ItemViewSet(viewsets.ModelViewSet):
    authentication_classes = [BasicAuthentication, TokenAuthentication]
    permission_classes = [IsAuthenticated]

    queryset = Item.objects.all()
    serializer_class = ItemSerializer
    
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['name', 'price']
    search_fields = ['name', 'price']