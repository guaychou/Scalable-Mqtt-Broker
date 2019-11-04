# Mosquitto-Alpine
Lightweight Mosquitto MQTT Broker Alpine Docker implementation

### Installation
Clone this repo First

```sh
$ git clone https://github.com/guaychou/Mosquitto-Alpine.git
```

Change to directory...

```sh
$ cd Mosquitto-Alpine
```

Build Docker Image
```sh
$ docker build -t <ImageName> . 
```
This will create the Mosquitto MQTT Broker docker image.

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map  MQTT port 1883 of the host to port 1883 

```sh
docker run -it -d -p 1883:1883 --name <ContainerName> <ImageName>:latest
```

Verify the deployment.

```sh
docker ps
```

Now if you want to publish the message use this command : 
```sh
docker exec -ti <containerName> mosquitto_pub -h 127.0.0.1  -t 'hello world' -m 'Hello I Am Mosquitto'
```

If you want to subscribe with specific topic use this command : 
```sh
docker exec -ti <containerName> mosquitto_sub -h 127.0.0.1  -t 'hello world'
```
