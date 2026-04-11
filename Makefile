STOW_APPS = fish starship zellij git neovim alacritty paru hyprland hyprpaper hyprlock hyprsunset waybar rofi dunst fontconfig ssh nix

.PHONY: all
all: $(STOW_APPS) pipewire

.PHONY: cli
cli: fish starship zellij neovim

.PHONY: $(STOW_APPS)
$(STOW_APPS): prepare-dirs
	stow $@

.PHONY: prepare-dirs
prepare-dirs:
	mkdir -p ~/.ssh
	mkdir -p ~/.config/fish

.PHONY: pipewire
pipewire:
	systemctl enable --user pipewire.service
	systemctl enable --user pipewire-pulse.service
	systemctl enable --user wireplumber.service

.PHONY: devcontainer
devcontainer:
	docker build -t devcontainer -f ./devcontainer/Dockerfile .
