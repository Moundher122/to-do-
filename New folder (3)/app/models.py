from django.db import models

# Create your models here.
class Note(models.Model):
  title=models.CharField( max_length=50)
  body=models.TextField()
  created=models.DateField(auto_now_add=True)

  class Meta:
   ordering = ['-created']

  


