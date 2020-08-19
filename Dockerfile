# docker build -t practice-raspberrypi . && docker run --rm -it --privileged -P practice-raspberrypi 

FROM balenalib/armv7hf-python:3.7

RUN apt-get update && \
    # apt-get upgrade && \
    apt-get -y install \
                iproute2 procps lsb-release upx file make \
                build-essential \
                libstdc++6 \
                python3-dev \
                apt-transport-https ca-certificates gnupg2 && \
    # Clean up
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/gotools

RUN pip install --upgrade pip

# Tools for python project
RUN pip install pipenv

# Project specific library installations
# RUN pip install -U rpi.gpio Flask requests gpiozero paho-mqtt colour

WORKDIR /workspace

COPY . /workspace

# Install project specific library dependencies using Pipfile.lock
RUN pipenv sync

# Forward ports
EXPOSE 8080

CMD [ "pipenv", "run", "python", "helloworld.py" ]