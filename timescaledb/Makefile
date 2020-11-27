T8C_INSTALL_BRANCH = 7.22

ready: t8c-install/README.md Makefile
	date > $@

t8c-install/README.md: Makefile
	rm -rfv t8c-install
	git clone https://github.com/turbonomic/t8c-install.git
	cd t8c-install && git checkout $(T8C_INSTALL_BRANCH)

clean:
	rm -f ready
	rm -rf t8c-install
