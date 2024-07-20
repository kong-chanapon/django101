from django.db import models

# Create your models here.
class Item(models.Model):

    name = models.CharField()
    price = models.IntegerField()
    stock = models.IntegerField()

    def __str__(self):
        return self.name