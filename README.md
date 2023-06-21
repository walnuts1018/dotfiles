# dotfiles

## Init

zsh install
```bash
sudo apt install zsh
chsh -s $(which zsh)
exit
```

zim install
```zsh
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
exit
```
chzmoi install
```zsh
sh -c "$(curl -fsLS get.chezmoi.io)"
mv bin .bin
```

```zsh
~/.bin/chezmoi init git@github.com:walnuts1018/dotfiles.git
```
