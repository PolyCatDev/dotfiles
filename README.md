Welcome to my dotfiles repo. This is where I store config
    files for the tools I use.

## Configs in this repo

In use configs get automatically automatically symlinked
to their respective directories using
[GNU Stow](https://www.gnu.org/software/stow/) and
configs not in use are simply ignored.

### Configs in use

- Bash
- Fastfetch
- Ghostty
- Git
- Godot
- Nvim
- Tmux
- Util-scripts

### Configs not in use

- Alacritty
- Codium
- Direwolf
- Otd
- Tf2
- Wlxoverlay

## Syncing configs

To link configs run:

```sh
just sync
```

And to delete symlinks run:

```sh
just sync -D
```
