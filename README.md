# My Dotfiles

A minimal, **stow‑based** dotfiles repository.

## Layout
```
 dotfiles/
 ├─ tmux/               →  ~/.tmux.conf
 ├─ zsh/                →  ~/.zshrc, ~/.oh‑my‑zsh/…
 ├─ vim/                →  ~/.vimrc, ~/.vim/
 ├─ nvim/.config/nvim/  →  ~/.config/nvim/
 ├─ bootstrap.sh        →  (re‑creates all symlinks)
 └─ README.md
```

## How to use
```bash
cd ~/dotfiles
./bootstrap.sh          # creates the symlinks with stow
```

## Adding a new tool
1. Create a folder (`mkdir -p newtool`).
2. Put the config files inside.
3. Run `stow newtool` (or re‑run `./bootstrap.sh`).

## License
Feel free to copy / adapt – it’s just my personal configuration.
