sudo apt update
sudo apt install zsh git
chsh -s $(which zsh)

curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
source .zshrc

chzmoi install

sh -c "$(curl -fsLS get.chezmoi.io)"

~/bin/chezmoi init --apply https://github.com/walnuts1018/dotfiles.git
