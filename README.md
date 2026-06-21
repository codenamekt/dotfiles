# My Dotfiles

A minimal, **Stow-based** dotfiles repository.

## What’s inside?

- `tmux/` – `~/.tmux.conf` and related settings.
- `zsh/` – `~/.zshrc`, `~/.zprofile`, `~/.zshenv`, Oh My Zsh customizations, and modular Zsh config.
- `bat/` – `bat` pager configuration using Catppuccin Mocha.
- `vim/` – `~/.vimrc` and Vim plugins.
- `nvim/.config/nvim/` – Neovim configuration.
- `bootstrap.sh` – installs system packages, clones Oh My Zsh, and runs Stow for known packages.

## Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/codenamekt/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Run the bootstrap script**

   ```bash
   ./bootstrap.sh
   ```

   This script is intended to be idempotent. It will:

   - install `git`, `stow`, `zsh`, `less`, and `bat` if they are missing on Debian/Ubuntu systems;
   - create a `bat` command symlink when the distro package installs `batcat` instead;
   - set Zsh as the default shell when possible;
   - clone Oh My Zsh into `zsh/oh-my-zsh/`;
   - clone Oh My Zsh and the Catppuccin `bat` themes;
   - run `stow --dotfiles -S` for `tmux`, `zsh`, `bat`, `vim`, and `nvim`;
   - build the `bat` theme cache so Catppuccin Mocha is available.

3. **Refresh Stow for a single package, if needed**

   ```bash
   stow --dotfiles -R zsh
   ```

4. **Reload tmux to apply the new config**

   Inside a running tmux session, press `<prefix> + R` or run:

   ```bash
   tmux source-file ~/.tmux.conf
   ```

## Using Stow directly

Each top-level folder (`tmux/`, `zsh/`, `bat/`, `vim/`, `nvim/`) is a Stow *package*.

```bash
cd ~/dotfiles
stow --dotfiles */   # or: stow --dotfiles zsh bat vim tmux nvim
```

To add a new package:

```bash
mkdir -p newtool
# add config files, e.g. newtool/.config/newtool/config
stow --dotfiles newtool
```

## Zsh + Oh My Zsh layout

The Zsh package is managed by Stow and uses this layout:

```text
zsh/
├── .zshrc                         # main interactive Zsh config
├── .zprofile                      # login-shell PATH setup
├── .zshenv                        # minimal env for all zsh shells
├── oh-my-zsh/                     # cloned by ./bootstrap.sh; ignored by git
├── custom/
│   ├── plugins/
│   │   └── dotfiles/
│   │       └── dotfiles.plugin.zsh
│   └── themes/
│       └── mytheme.zsh-theme
└── .zsh/
    ├── aliases.zsh
    ├── completions/
    ├── completions.zsh
    ├── env.zsh
    └── functions.zsh
```

After running `stow --dotfiles zsh`, the important links are:

```text
~/.zshrc            -> ~/dotfiles/zsh/.zshrc
~/.zprofile         -> ~/dotfiles/zsh/.zprofile
~/.zshenv           -> ~/dotfiles/zsh/.zshenv
~/.zsh              -> ~/dotfiles/zsh/.zsh
~/.zsh/oh-my-zsh    -> ~/dotfiles/zsh/oh-my-zsh
~/.zsh/custom       -> ~/dotfiles/zsh/custom
```

The `.zshrc` expects Oh My Zsh at:

```text
~/.zsh/oh-my-zsh/oh-my-zsh.sh
```

If that path is missing, it prints a message asking you to run `./bootstrap.sh`.

### Zsh helper commands

The local `dotfiles` Oh My Zsh plugin adds a small helper:

```bash
dotfiles status   # show ~/dotfiles status
dotfiles pull     # fast-forward pull ~/dotfiles
dotfiles stow     # re-apply Stow links for zsh, vim, tmux, and nvim
dotfiles reload   # alias for `dotfiles stow`
```

### Adding Zsh config

- Put aliases in `zsh/.zsh/aliases.zsh`.
- Put functions in `zsh/.zsh/functions.zsh`.
- Put environment exports in `zsh/.zsh/env.zsh`.
- Put completion path setup in `zsh/.zsh/completions.zsh`.
- Add custom themes under `zsh/custom/themes/`.
- Add custom plugins under `zsh/custom/plugins/<plugin>/<plugin>.plugin.zsh`.

## Additional notes

- **CPU/RAM icons** in tmux are rendered by the `catppuccin/tmux` plugin using Nerd Font glyphs.
  Make sure your terminal is using a Nerd Font, such as FiraCode Nerd Font, Hack Nerd Font, or JetBrainsMono Nerd Font.
  If you still see `▯?` symbols, install a patched font and select it in your terminal profile.

## License

Feel free to copy / adapt – it’s just my personal configuration.
