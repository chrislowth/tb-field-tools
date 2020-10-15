# Originally from..
#	https://raw.githubusercontent.com/andrew-d/static-binaries/master/nano/Dockerfile

FROM debian:jessie

# Install build tools
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yy \
        automake            \
        build-essential     \
        curl                \
        git                 \
        pkg-config

RUN mkdir /build
ADD . /build

# This builds the program and copies it to /output
CMD /build/build.sh
