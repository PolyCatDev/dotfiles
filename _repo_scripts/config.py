from pathlib import Path

stow_modules: dict[str, list[Path]] = {"in use":[], "not in use":[]}
excluded_dirs = {"archive", ".git", "__pycache__", "_repo_scripts"}

root_path = Path(".")
archive_path = Path("./archive")
