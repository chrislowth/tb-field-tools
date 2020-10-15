tbstatic.tgz:
	cd screen && make
	cd nano && make
	rm -rf dist.d
	mkdir -p dist.d/bin
	cp screen/screen nano/nano dist.d/bin
	cp screen/screenrc dist.d/.screenrc
	cp nano/nanorc dist.d/.nanorc
	cd dist.d && tar cvfz ../tbstatic.tgz bin .nanorc .screenrc
