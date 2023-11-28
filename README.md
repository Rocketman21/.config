#.config

## How to install

1. Clone this to your ~/.config
2. Install nvim
#### macOS
```
brew install nvim
```

2. Install starship.rs, add `eval "$(starship init zsh)"` to the end of your
`.zshrc` (if using zsh)
3. tmux

3.1 Install

#### macOS
```
brew install tmux
```

3.2 Install tpm

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

3.3 Source tmux.conf

```
tmux source ~/.config/tmux/tmux.conf
```

3.3 Fetch plugins

```
<Prefix>I

(<C-b>I - by default)
```

4. Install submodues

```
git submodule update --init --recursive
```

5. Install packer.nvim

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

6. Install fd and rg (needed for telecsope and other plugins)
#### macOS
```
brew install fd rg
```
7. Enter nvim and fetch all plugins with `:PackerSync`
8. Reopen vim
9. ...
10. Profit!
