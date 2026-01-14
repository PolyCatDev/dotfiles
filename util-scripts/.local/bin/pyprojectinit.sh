#!/bin/bash

set -euo pipefail

cat << EOF > pyproject.toml
[project]
name = "$(basename $PWD)"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=$(python --version | awk '{print $2}' | rev | cut -d. -f2- | rev)"
dependencies = []
EOF

echo -e "\e[32mCreated \"pyproject.toml\"\e[0m"
