from django.db import models

# Create your models here.
class Shop(models.Model):
    shop_name = models.CharField(max_length=255, null = True)
    shop_desc = models.CharField(max_length=255, null = True)
    rest_date = models.CharField(max_length=255, null = True)
    parking_info = models.CharField(max_length=255, null = True)
    img_path = models.CharField(max_length=255, null = True)


class Curriculum(models.Model):
    name = models.CharField(max_length=255)

    def __str__(self):
        return str(self.id) + '번 / ' + self.name
