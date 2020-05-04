MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(patsubst %/,%,$(dir $(MKFILE_PATH)))


default: install

install: update packages setup

setup: zsh tmux docker

packages:
	@sudo apt update
	@sudo apt install -y tmux zsh lvm2 virtualbox virtualbox-guest-additions-iso nautilus-dropbox

fonts:
	@sudo apt install -y ttf-bitstream-vera fonts-terminus fonts-roboto fonts-lato fonts-liberation \
						fonts-hack fonts-inconsolata fonts-firacode fonts-open-sans fonts-powerline
	# TODO: Add SourceCodePro fonts

zsh:
	@sudo ln -sf $(CURRENT_DIR)/zshrc ~/.zshrc
	@sudo chsh -s /bin/zsh $(USER)

tmux:
	@sudo ln -sf $(CURRENT_DIR)/tmux.conf ~/.tmux.conf
	# Start tmux in current user session
	@mkdir -p ~/.config/systemd/user
	@cp -R $(CURRENT_DIR)/systemd-units/tmux@.service ~/.config/systemd/user
	@systemctl enable --user tmux@.service

update:
	@git submodule update --remote --merge

docker:
	# Install Docker CE from original repository...

.PHONY: default install packages fonts setup zsh tmux docker update
