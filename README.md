# docker-rpi-couchpotato

[Docker image](https://registry.hub.docker.com/u/sodre90/rpi-couchpotato/) for running CouchPotato on a Raspberry PI.

## Usage

You can run the image with the following command.

    docker run -d -p 5050:5050 -v /path/to/movies:/movies -v /path/to/config:/config --restart=always --name couchpotato sodre90/rpi-couchpotato

Note the `--restart=always` parameter, that will restart the Docker container every time it stops. We need that because CouchPotato will update itself periodically and restart the process, causing the Docker container to stop.


## Build

You can **optionally** build the image `sodre90/rpi-couchpotato` with the latest CouchPotato sources. To do that just execute the following command once you have checked out the [source repository](https://github.com/sodre90/docker-rpi-couchpotato).

    docker build -t sodre90/rpi-couchpotato .
