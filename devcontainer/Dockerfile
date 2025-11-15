FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
  fish starship neovim zellij git \
  rust rust-analyzer mold cargo-nextest cargo-expand cargo-bloat cargo-geiger

RUN useradd -m --uid 1000 dev
USER dev
WORKDIR /home/dev
