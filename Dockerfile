# Base image
FROM resin/rpi-raspbian:wheezy

# Maintainer info
MAINTAINER Peter Erdos <erdos.peter.bme@gmail.com>

# Update and upgrade
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install git-core libffi-dev libssl-dev zlib1g-dev libxslt1-dev libxml2-dev python python-pip python-dev build-essential -y
RUN pip install lxml cryptography pyopenssl

# Install CouchPotato
RUN cd /opt && \
  git clone https://github.com/CouchPotato/CouchPotatoServer.git

# Expose port
EXPOSE 5050

# Set working directory
WORKDIR /opt/CouchPotatoServer

# Run CouchPotato
ENTRYPOINT ["python", "CouchPotato.py", "--config_file", "/config/CouchPotato.cfg", "--data_dir", "/config/data", "--console_log"]
