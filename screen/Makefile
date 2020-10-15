screen: Makefile Dockerfile
	docker image rm tb-static-screen:latest || true
	docker build . -t tb-static-screen
	mkdir -p output
	docker run --rm -v `pwd`/output:/output tb-static-screen cp /build/screen /output
	cp output/screen screen
	sudo rm -r output

clean:
	rm -f screen
	docker image rm tb-static-screen:latest || true
