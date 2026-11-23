from pathlib import Path
from textwrap import dedent

from .config import *
from .get_public_modules import append_directory_paths


def generate_module_index(stow_modules: dict[str, list[Path]]) -> str:

    header = dedent("""\
        ## In this repo
        """)
    
    index = ""
    for key in stow_modules.keys():
        index += f"\n### Configs {key}\n\n"
        for path_element in stow_modules[key]:
            index += f"- {path_element.name.capitalize()}\n"
            
    return f"{header}{index}"


if __name__ == "__main__":

    readme_header = dedent("""\
        Welcome to my dotfiles repo. This is where I store config
            files for the tools I use.
        """)

    readme_footer = dedent("""\
        ## Syncing configs

        In use configs get automatically automatically symlinked
        to their respective directories using
        [GNU Stow](https://www.gnu.org/software/stow/) and
        configs not in use are simply ignored.

        To link configs run:

        ```sh
        just sync
        ```

        And to delete symlinks run:

        ```sh
        just sync -D
        ```
        """)


    append_directory_paths(stow_modules["in use"], root_path, excluded_dirs)
    append_directory_paths(stow_modules["not in use"], archive_path, excluded_dirs)

    print(f"{readme_header}\n{generate_module_index(stow_modules)}\n{readme_footer}".rstrip("\n"), end="")
