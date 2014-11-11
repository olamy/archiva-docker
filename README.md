# Archiva Docker image

# Usage

In order to get the logs with `docker logs` the `-t` option needs to be used.

    docker run -t -p 8080:8080 olamy/archiva

# Building

    docker build -t olamy/archiva .
