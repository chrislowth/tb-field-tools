FROM ubuntu:18.04

ENV SCREEN_VERSION=4.3.1

RUN apt update -yy && \
	apt upgrade -yy && \
	apt install -yy curl gcc ncurses-dev make && \
	mkdir /build && \
	cd /build && \
	curl -O https://ftp.gnu.org/gnu/screen/screen-${SCREEN_VERSION}.tar.gz && \
	tar xfz screen-${SCREEN_VERSION}.tar.gz && \
	cd screen-${SCREEN_VERSION} && \
	./configure && \
	make LDFLAGS="-static" LIBS="-ltinfo -lcrypt" && \
	cp screen /build && \
	cd /build && \
	rm -rfv screen-${SCREEN_VERSION}
