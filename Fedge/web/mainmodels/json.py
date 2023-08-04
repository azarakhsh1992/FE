from django.db import models
import requests
import json
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
from rest_framework.decorators import action
from rest_framework import viewsets, status
from django.http import HttpResponse
from django.http import JsonResponse
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response



class Json_draft(models.Model):
    name = models.CharField(max_length=128)
    code =models.CharField(max_length=64,default='request')
    cid = models.IntegerField(default=4711)
    adr =models.CharField(max_length=128,default='/iolinkmaster/port[2]/iolinkdevice/pdin/getdata')
    url = models.URLField(max_length=32, default="http://192.168.0.4")
    data = models.JSONField(max_length=256, blank=True)
    # moethod = models.CharField(max_length=16, default='POST')
    # payload = models.JSONField(max_length=512, editable=False)
    # def save(self, *args, **kwargs):
    #     if self.data!="":
    #         self.payload = '{"code":"%s","cid":%s,"adr":"%s","data":{%s}}'%(self.code, self.cid, self.adr, self.data)
    #     elif self.data == "":
    #         self.payload = '{"code":"%s","cid":%s,"adr":"%s"}'%(self.code, self.cid, self.adr)
    #     else:
    #         return print("error")
    #     super(Json_draft, self).save(*args, **kwargs)

# @api_view(['GET', 'POST'])
# def snippet_list(request):
#     """
#     List all code snippets, or create a new snippet.
#     """
#     if request.method == 'GET':
#         snippets = Json_draft.objects.all()
#         serializer = Jsonserializer(snippets, many=True)
#         return Response(serializer.data)

#     elif request.method == 'POST':
#         serializer = Jsonserializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    # def send_json(url, headers, data, method ='POST'):
    #     """
    #     Function to send a JSON request to the specified URL.
        
    #     Parameters:
    #         url (str): The URL to which the JSON request will be sent.
    #         data (dict): The JSON data to be included in the request body.
    #         method (str, optional): The HTTP method to use for the request (e.g., 'GET', 'POST', 'PUT', 'DELETE'). Default is 'POST'.
    #         headers (dict, optional): Additional headers to include in the request. Default is None.

    #     Returns:
    #         dict: The JSON response from the server.

    #     Raises:
    #         requests.exceptions.RequestException: If there is an error during the request.
    #     """
    #     headers = headers or {}
    #     headers['Content-Type'] = 'application/json'
    #     print(headers)
    #     try:
    #         response = requests.request(method, url, data=json.dumps(data), headers=headers)
    #         print(response)
    #         response.raise_for_status()  # Raise an exception for HTTP errors (4xx, 5xx)
    #         print(response.json)
    #         return response.json()
    #     except requests.exceptions.RequestException as e:
    #         print(e)
    #         raise e

