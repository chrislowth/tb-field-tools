MUSL_VERSION=1.1.16
NANO_VERSION=2.8.4
NCURSES_VERSION=5.9

nano: Makefile Dockerfile build.sh
	curl -LO http://www.musl-libc.org/releases/musl-$(MUSL_VERSION).tar.gz
	curl -LO https://ftp.gnu.org/gnu/ncurses/ncurses-$(NCURSES_VERSION).tar.gz
	curl -LO https://www.nano-editor.org/dist/v2.8/nano-$(NANO_VERSION).tar.xz
	docker build -t tbnano .
	mkdir -p output
	docker run -v `pwd`/output:/output --name tbnano tbnano
	cp output/linux/x86_64/nano .
	cp output/linux/x86_64/COPYING .
	sudo rm -r output

clean:
	sudo rm -rfv nano output *.tar.gz *.tar.xz COPYING || :
	docker container rm tbnano || :
	docker image rm tbnano || :
