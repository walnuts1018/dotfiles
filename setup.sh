#!/bin/bash

set -euo pipefail
cd "$(dirname "$0")"

printf "password: "
read password

if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  echo "unsupported os: ($(uname -a))"
  exit 1
fi

if [ "${OS}" == 'Linux' ]; then
    {{ type apt >/dev/null 2>&1 }} && sudo apt install -y zsh git
    echo "$password" | sudo -S chsh -s $(which zsh)
    [[ ! -s "$HOME/.zim" ]] && curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

    sh -c "$(curl -fsLS get.chezmoi.io)" && echo "$password" | sudo -S mv $HOME/bin/chezmoi /usr/local/bin
    chezmoi init --apply https://github.com/walnuts1018/dotfiles.git

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

