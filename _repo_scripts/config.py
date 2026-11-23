from pathlib import Path

stow_modules: dict[str, list[Path]] = {"in use":[], "not in use":[]}
excluded_dirs = {"archive", ".git", "__pycache__", "_repo_scripts"}

repo_root_path = Path(".")
