
set default-list := true

commit_updated_nvim_plugins_chore:
    git add nvim/.config/nvim/lazy-lock.json
    git commit -m "nvim(chore): Updated plugins"

sync stow_option="":
    mkdir -p ~/.config/tmux/plugins/
    mkdir -p ~/.config/godot/
    mkdir -p ~/.local/share/fonts/

    in_use_modules=$(python -m scripts.get_in_use_modules) && \
    in_use_modules_root_dir=$(python -m scripts.get_in_use_modules --root-directory) && \
    (cd $in_use_modules_root_dir && stow --target=$HOME --verbose=2 {{stow_option}} $in_use_modules)

generate_readme:
    echo "$(python -m scripts.generate_readme)" > README.md
