from pathlib import Path

stow_modules: dict[str, list[Path]] = {"in use":[], "not in use":[]}
excluded_dirs = {"archive", ".git", "__pycache__", "_repo_scripts"}

in_use_modules_path = Path("./modules/in_use")
not_in_use_modules_path = Path("./modules/not_in_use")
