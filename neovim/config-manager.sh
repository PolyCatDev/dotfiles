#!/bin/bash

# Config
PLATFORM="github.com"
NAME="polycatdev"
REPO="dotfiles"
DIR_NAME="neovim"

# Functions
printError () {
    echo -e "\033[31mERROR: $1 \033[0m"
}

if [[ -d $REPO ]]; then
    printError "Directory '$REPO' already exists"
    exit 1
fi

# Instructions
git clone "https://$PLATFORM/$NAME/$REPO.git"
rm -rf "$REPO/$DIR_NAME/*"

mkdir -p "$REPO/$DIR_NAME"

cp -r $(ls | grep -v $REPO) $REPO/$DIR_NAME

if [[ -n "$1" ]]; then
    
    if [[ "$1" == "-c" || "$1" == "--commit" ]] && [[ -n "$2" ]]; then

        cd $REPO
        git add .
        git commit -m "$2"
    
        if [[ $3 == "-p" || $3 == "--push" ]]; then
            git push
        fi

        cd ..

    else
        printError "No commit message defined"
        exit 1
    fi
fi
