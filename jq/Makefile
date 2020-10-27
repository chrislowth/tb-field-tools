jq COPYING: Makefile
	rm -f jq-1.6.tar.gz
	rm -rf jq-1.6
	wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.tar.gz
	tar xfz jq-1.6.tar.gz
	cd jq-1.6/modules/oniguruma && autoreconf -fvi && ./configure
	cd jq-1.6 && ./configure
	cd jq-1.6 && make LDFLAGS="-all-static"
	cp jq-1.6/jq jq
	cp jq-1.6/COPYING COPYING
	strip jq

clean:
	rm -fv jq COPYING jq-1.6.tar.gz
	rm -rfv jq-1.6
