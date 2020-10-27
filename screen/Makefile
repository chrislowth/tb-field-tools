screen: Makefile Dockerfile
	docker image rm tb-static-screen:latest || true
	docker build . -t tb-static-screen
	mkdir -p output
	docker run --rm -v `pwd`/output:/output tb-static-screen cp /build/screen /output
	docker run --rm -v `pwd`/output:/output tb-static-screen cp /build/COPYING /output
	cp output/screen screen
	cp output/COPYING COPYING
	sudo rm -r output
	strip screen

clean:
	rm -f screen out COPYING
	rm -rf output
	docker image rm tb-static-screen:latest || true
