from rest_framework.decorators import api_view
from rest_framework.response import Response
from . import models
from .seralizer import NoteSerializer
from django.http import HttpResponse
# Create your views here.
@api_view(['GET'])
def getdata(request):
    person = models.Note.objects.all()
    ser= NoteSerializer(person,many=True)
    return Response(ser.data)


@api_view(['GET'])
def getdat(request,id):
    try:
        person = models.Note.objects.get(id=id)
        ser= NoteSerializer(person,many=False)
        return Response(ser.data)       
    except models.Note.DoesNotExist:
        return Response({"error": "Note not found"}, status=404)
    
@api_view(['POST'])
def create_note(request):
    se=NoteSerializer(data=request.data)
    if se.is_valid():
        se.save()
    return Response(se.data)

@api_view(['PUT'])
def updatenote(request,pk):
    up=models.Note.objects.get(id=pk)
    se=NoteSerializer(instance=up,data=request.data)
    if se.is_valid():
        se.save()
    return Response(se.data)


@api_view(['DELETE'])
def deletenote(request,pk):
   try:
        up=models.Note.objects.get(id=pk)
        up.delete()
        return Response('item deleted')
   except models.Note.DoesNotExist:
       return  Response('item not found',status=404)
