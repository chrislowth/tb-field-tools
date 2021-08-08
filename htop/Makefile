V = 3.0.5

htop: htop-$(V)/htop Makefile
	cp $< $@
	cp htop-$(V)/COPYING .

htop-$(V)/htop: htop-$(V)/README Makefile
	cd htop-$(V) && ./autogen.sh && ./configure && make LDFLAGS="-static" LIBS="-lncursesw -ltinfo -ldl -lm -lgpm"

htop-$(V)/README: $(V).tar.gz Makefile
	tar xfz $(V).tar.gz

$(V).tar.gz: Makefile
	curl -O -L https://github.com/htop-dev/htop/archive/refs/tags/$(V).tar.gz

clean:
	rm -rfv $(V).tar.gz htop-$(V) htop COPYING
