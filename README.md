# Dockerized Hello World Web Server on Raspberry Pi 4

## Purpose
1. To demonstrate the use of Docker to build and deploy a Python 3 application on a Raspberry Pi 4.

## Development Machine Requirements
1. [Visual Studio Code](https://code.visualstudio.com/)
2. [Remote - Containers extension for Visual Studio Code](https://aka.ms/vscode-remote/download/extension)
3. [Docker](https://docs.docker.com/install/#supported-platforms)

## Raspberry Pi 4 Requirements
1. [Git] (https://projects.raspberrypi.org/en/projects/getting-started-with-git)
2. [Docker](https://docs.docker.com/install/#supported-platforms)

# Set Up & build the project on the Raspberry Pi 4
```
$ git clone git@github.com:senglin/rpi-helloworld.git
$ cd rpi-helloworld
$ docker build -t rpi-helloworld .
$ docker run --rm -P rpi-helloworld 
```

# Testing the helloworld application

Determine the forwarded ports on the Raspberry Pi 4 by typing this in the command line:
```
# docker container ls
CONTAINER ID   IMAGE            COMMAND                  CREATED           STATUS           PORTS                     NAMES
a641ab7e24d4   rpi-helloworld   "/usr/bin/entry.sh p…"   17 seconds ago    Up 13 seconds    0.0.0.0:32780->8080/tcp   festive_bhabha
```

From the development machine, access the port on the raspberry pi
```
$ curl raspberrypi:32780
{"message": "Hello World!"}
```




