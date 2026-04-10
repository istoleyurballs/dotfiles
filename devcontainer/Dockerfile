FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
  stow \
  fish starship neovim zellij git \
  rust rust-analyzer mold cargo-nextest cargo-expand cargo-bloat cargo-geiger \
  vscode-html-languageserver prettier \
  wayland wayland-protocols

RUN useradd -m --uid 1000 dev
USER dev

COPY --chown=1000:1000 . /home/dev/dotfiles
WORKDIR /home/dev/dotfiles
RUN make cli

WORKDIR /home/dev
