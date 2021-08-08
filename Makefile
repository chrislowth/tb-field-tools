LICDIR = dist.d/licenses
BINDIR = dist.d/bin
S3FOLDER = turbonomic-emea-cs-bucket/tb-field-tools
TARFILE = tb-field-tools.tgz

$(TARFILE): k9s/k9s screen/screen nano/nano yq/yq jq/jq timescaledb/ready Makefile
	rm -rf dist.d
	mkdir -p $(BINDIR) $(LICDIR)
	cp k9s/k9s screen/screen nano/nano yq/yq jq/jq $(BINDIR)
	cp yq/LICENSE $(LICDIR)/LICENSE-yq
	cp jq/COPYING $(LICDIR)/COPYING-jq
	cp k9s/LICENSE $(LICDIR)/LICENSE-k9s
	cp screen/COPYING $(LICDIR)/COPYING-screen
	cp nano/COPYING $(LICDIR)/COPYING-nano
	cp reporting/LICENSE $(LICDIR)/LICENSE-enableReporting
	cp screen/screenrc dist.d/.screenrc
	cp nano/nanorc dist.d/.nanorc
	cd dist.d && tar cvfz ../$(TARFILE) bin/* licenses/* .nanorc .screenrc

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

timescaledb/ready:
	cd timescaledb && make

clean:
	cd screen && make clean
	cd nano && make clean
	cd yq && make clean
	cd jq && make clean
	cd k9s && make clean
	cd timescaledb && make clean
	rm -rf dist.d
	rm -f $(TARFILE)

copy-to-s3:
	aws s3 cp $(TARFILE) "s3://$(S3FOLDER)/$(TARFILE)" --acl public-read
