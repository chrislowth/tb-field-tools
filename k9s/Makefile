VERSION = 0.22.1

all: k9s LICENSE

clean:
	rm -f k9s LICENSE k9s_Linux_x86_64.tar.gz

k9s: k9s_Linux_x86_64.tar.gz Makefile
	tar xvfz k9s_Linux_x86_64.tar.gz k9s

LICENSE: k9s_Linux_x86_64.tar.gz Makefile
	tar xvfz k9s_Linux_x86_64.tar.gz LICENSE

k9s_Linux_x86_64.tar.gz: Makefile
	rm -f $@
	wget https://github.com/derailed/k9s/releases/download/v$(VERSION)/k9s_Linux_x86_64.tar.gz
