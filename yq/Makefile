export GOPATH=$(PWD)/gopath

PKG = github.com/mikefarah/yq
VERSION = v3-prod

all: yq LICENSE

yq: Makefile gopath/src/$(PKG)/yq.go
	cd gopath/src/$(PKG) && git checkout $(VERSION)
	cd gopath/src/$(PKG) && env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -ldflags '-s -w -extldflags "-static"'
	mv gopath/src/$(PKG)/yq yq

LICENSE: gopath/src/$(PKG)/yq.go Makefile
	cp gopath/src/$(PKG)/LICENSE LICENSE

gopath/src/$(PKG)/yq.go: Makefile
	rm -rfv gopath
	mkdir gopath
	go get -d $(PKG)

clean:
	rm -f yq LICENSE
	rm -rf gopath
