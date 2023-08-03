from django.db import models
import requests
import json

class Json_draft(models.Model):
    name = models.CharField(max_length=128)
    code =models.CharField(max_length=64,default='request')
    cid = models.IntegerField(default=4711)
    adr =models.CharField(max_length=128,default='/iolinkmaster/port[2]/iolinkdevice/pdin/getdata')
    this_url = models.URLField(max_length=32, default="http://192.168.0.4")
    this_data = models.TextField(max_length=256, blank=True)
    body = models.TextField(max_length=512, editable=False)
    this_headers = None
    # method = models.CharField(max_length=16, default='POST')
    def save(self, *args, **kwargs):
        if self.this_data!="":
            self.body = '{"code":"%s","cid":%s,"adr":"%s","data":{"%s"}}'%(self.code, self.cid, self.adr, self.data)
        elif self.this_data == "":
            self.body = '{"code":"%s","cid":%s,"adr":"%s"}'%(self.code, self.cid, self.adr)
        else:
            return print("error")
        super(Json_draft, self).save(*args, **kwargs)

    def send_json(self, method='POST'):
        """
        Function to send a JSON request to the specified URL.
        
        Parameters:
            url (str): The URL to which the JSON request will be sent.
            data (dict): The JSON data to be included in the request body.
            method (str, optional): The HTTP method to use for the request (e.g., 'GET', 'POST', 'PUT', 'DELETE'). Default is 'POST'.
            headers (dict, optional): Additional headers to include in the request. Default is None.

        Returns:
            dict: The JSON response from the server.

        Raises:
            requests.exceptions.RequestException: If there is an error during the request.
        """
        headers = self.this_headers or {}
        headers['Content-Type'] = 'application/json'
        print(headers)
        try:
            response = requests.request(method, self.this_url, data=json.dumps(self.body), headers=headers)
            print(response)
            response.raise_for_status()  # Raise an exception for HTTP errors (4xx, 5xx)
            print(response.json)
            print(method, self.this_data, self.this_data,self.body,self.this_headers)
            return response.json()
        except requests.exceptions.RequestException as e:
            print(e)
            raise e
        
