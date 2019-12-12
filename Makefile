default: install

install:
	@mkdir -p ~/.config/systemd/user && \
		cp -R systemd-units/* ~/.config/systemd/user && \
		systemctl enable --user tmux@.service

.PHONY: default install
