HUGO = hugo
GIT = git

POST_NAME =

server:
	hugo server -D

install-hugo-darwin:
	curl -LO https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_0.83.1_macOS-64bit.tar.gz && \
	tar zxf hugo_0.83.1_macOS-64bit.tar.gz && \
	cp hugo_0.83.1_macOS-64bit/hugo /usr/local/bin && \
	chmod a+x /usr/local/bin/hugo && \
	rm -rf hugo_0.83.1_macOS-64bit.tar.gz hugo_0.83.1_macOS-64bit

new-post:
	$(HUGO) new posts/$(POST_NAME).md

build: update-submodule
	$(HUGO) --buildDrafts --gc --verbose --minify

update-submodule: download-submodule
	$(GIT) submodule update --remote --merge

download-submodule:
	$(GIT) submodule update --init --recursive
