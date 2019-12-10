
init:
	@git submodule init

default: sync

sync:
	@git submodule update

.PHONY: default sync init
