FROM fedora:latest
MAINTAINER David Hannequin <david.hannequin@gmail.com>

RUN dnf update -y && dnf groupinstall -y "RPM Development Tools" && \
                     dnf -y install sudo automake make cmake vim bash && \
                     dnf -y install dnf-utils wget neovim python3-devel python3-neovim && \
                     dnf -y install keyutils fedpkg rpmconf git-all mkfontscale && \
                     dnf -y install golang golang-x-tools-gopls python3-pbr && \
                     dnf -y install rust rustfmt cargo && \
                     dnf -y clean all

RUN useradd -m -g wheel -d /home/dev dev && sed -i -e 's/# %wheel/%wheel/g' /etc/sudoers

RUN su - dev -c "curl -sLf https://spacevim.org/install.sh | bash"

RUN su - dev -c "nvim --headless +'call dein#install()' +qall"

COPY init.toml /home/dev/.SpaceVim.d/init.toml

USER dev

WORKDIR /home/dev
