
set default-list := true

commit_updated_nvim_plugins_chore:
    git add nvim/.config/nvim/lazy-lock.json
    git commit -m "nvim(chore): Updated plugins"

sync stow_option="":
    mkdir -p ~/.config/tmux/plugins/
    mkdir -p ~/.config/godot/
    mkdir -p ~/.local/share/fonts/
    
    stow --target=${HOME} --verbose=1 {{stow_option}} $(python -m _repo_scripts.get_public_modules)

regenerate_readme:
    echo "$(python -m _repo_scripts.generate_readme)" > README.md
