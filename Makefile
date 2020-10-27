LICDIR = dist.d/licenses
BINDIR = dist.d/bin

tbstatic.tgz: k9s/k9s screen/screen nano/nano yq/yq jq/jq
	rm -rf dist.d
	mkdir -p $(BINDIR) $(LICDIR)
	cp k9s/k9s screen/screen nano/nano yq/yq jq/jq $(BINDIR)
	cd $(BINDIR) && upx *
	cp yq/LICENSE $(LICDIR)/LICENSE-yq
	cp jq/COPYING $(LICDIR)/COPYING-jq
	cp k9s/LICENSE $(LICDIR)/LICENSE-k9s
	cp screen/COPYING $(LICDIR)/COPYING-screen
	cp nano/COPYING $(LICDIR)/COPYING-nano
	cp screen/screenrc dist.d/.screenrc
	cp nano/nanorc dist.d/.nanorc
	cd dist.d && tar cvfz ../tbstatic.tgz bin/* licenses/* .nanorc .screenrc

k9s/k9s:
	cd k9s && make

screen/screen:
	cd screen && make

nano/nano:
	cd nano && make

yq/yq:
	cd yq && make

jq/jq:
	cd jq && make

clean:
	cd screen && make clean
	cd nano && make clean
	cd yq && make clean
	cd jq && make clean
	cd k9s && make clean
	rm -rf dist.d
	rm -f tbstatic.tgz
