LICDIR = dist.d/licenses
BINDIR = dist.d/bin

tbstatic.tgz: k9s/k9s screen/screen nano/nano yq/yq
	rm -rf dist.d
	mkdir -p $(BINDIR) $(LICDIR)
	cp k9s/k9s screen/screen nano/nano yq/yq $(BINDIR)
	cp yq/LICENSE $(LICDIR)/LICENSE-yq
	cp k9s/LICENSE $(LICDIR)/LICENSE-k9s
	cp screen/COPYING $(LICDIR)/COPYING-screen
	cp nano/COPYING $(LICDIR)/COPYING-nano
	cp screen/screenrc dist.d/.screenrc
	cp nano/nanorc dist.d/.nanorc
	cd dist.d && tar cvfz ../tbstatic.tgz bin .nanorc .screenrc

k9s/k9s:
	cd k9s && make

screen/screen:
	cd screen && make

nano/nano:
	cd nano && make

yq/yq:
	cd yq && make

clean:
	cd screen && make clean
	cd nano && make clean
	cd yq && make clean
	cd k9s && make clean
	rm -rf dist.d
	rm -f tbstatic.tgz
