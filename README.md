CONTAINERIZATION:

PostgreSQL and TimescaleDB:
https://hub.docker.com/r/timescale/timescaledb/tags?page=1
https://docs.timescale.com/self-hosted/latest/configuration/docker-config/

docker pull timescale/timescaledb:latest-pg15

docker run -d --name fedge -p 127.0.0.1:5432:5432 -e POSTGRES_USER=fedge -e POSTGRES_PASSWORD=75401614 timescale/timescaledb:latest-pg15

https://docs.timescale.com/self-hosted/latest/install/installation-docker/#install-self-hosted-timescaledb-from-a-pre-built-container


with this guide can the PostgreSQL and Timescale be running on a Docker Container.

When a Container is being deleted, ofcourse all of the data would be lost with it. 


Environment variables of Django:
Broker IP_adress: (ex. '192.168.137.1')
mqtt_publish.py/ send_mqtt_latch(BROKER_IP)
mqtt_publish.py/ send_mqtt_led(BROKER_IP)
when applicable:
CORS_ALLOWED_ORIGINS must be set through environment variables

Running on container:
given elements:
IP IP_adress
Port
path to ssl certificate and key
(ex. python manage.py runsslserver --certificate cert.pem --key key.pem 0.0.0.0:8000)


Environment variables of Python Application as middleware:

PLC_NAME=$PLC_name (ex. 'KAAASDASASDVDASDASACAD')
BROKER_IP=$broker (ex. '192.168.137.1')
BACKEND_IP=$django_url (ex. 'localhost:8000' eventually will be like: 'https://localhost:8000/web/mqttmiddleware/')

Environment variables of React Frontend:

in .env:
PORT (ex. 3000)
HOST (ex. 0.0.0.0)
REACT_APP_API (ex. 192.168.137.1:5000)
in package.json:
"proxy": "https://localhost:5000",

Running on container:
path to ssl certificate and key

command:
RUN npm build --force
RUN npm start