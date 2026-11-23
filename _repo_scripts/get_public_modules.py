from pathlib import Path

from .config import *

def append_directory_paths(empty_list: list[Path], parent_directory: Path, excluded_dirs: set[str]) -> None:
    """ Appends paths of directories contained withing a given directory whilst
        excluding the ones in a given directory set.
    """

    for element in parent_directory.iterdir():
        if element.is_dir() and element.name not in excluded_dirs:
            empty_list.append(element)


if __name__ == "__main__":

    append_directory_paths(stow_modules["in use"], root_path, excluded_dirs)

    for path in stow_modules["in use"]:
        print(path.name, end=" ")
