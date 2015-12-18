PREFIX ?= /usr/local
PWD := $(shell pwd)

all: install
install:
	mkdir -p '$(PREFIX)/bin'
	ln -sf '$(PWD)/tidbit' '$(PREFIX)/bin'
	[ -e styles.css ] || cp styles.css.sample styles.css
uninstall:
	rm -f '$(PREFIX)/bin/tidbit'
