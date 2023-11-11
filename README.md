# dotfiles

## Init

zsh install
```bash
sudo apt install zsh git
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
~/.bin/chezmoi init --apply https://github.com/walnuts1018/dotfiles.git
```
