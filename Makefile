PREFIX ?= /usr/local
PWD := $(shell pwd)

all: install
install:
	install -d '$(PREFIX)/bin'
	ln -sf '$(PWD)/tidbit' '$(PREFIX)/bin'
	install -d '$(PREFIX)/share/zsh/site-functions'
	install -m 644 '_tidbit' '$(PREFIX)/share/zsh/site-functions'
	[ -e styles.css ] || cp 'styles.css.sample' 'styles.css'
uninstall:
	rm -f '$(PREFIX)/bin/tidbit'
