#!/usr/bin/env bash

# Run with source install.sh in an admin terminal
# Get the directory where the script is located
BASEDIR="$(cd "$(dirname -- "$0")" && pwd)"
cd "$BASEDIR" || exit 1  # Exit if changing directory fails

# Remove existing configuration files if they exist
[ -f ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.vimrc ] && rm ~/.vimrc
[ -f ~/.pylintrc ] && rm ~/.pylintrc

# Create symbolic links to the new configuration files
# Check if the link already exists before creating it
if [ ! -L ~/.bashrc ]; then
    ln -s "${BASEDIR}/.bashrc" ~/.bashrc
else
    echo "Symbolic link ~/.bashrc already exists."
fi

if [ ! -L ~/.vimrc ]; then
    ln -s "${BASEDIR}/../vim/.vimrc" ~/.vimrc
else
    echo "Symbolic link ~/.vimrc already exists."
fi

if [ ! -L ~/.pylintrc ]; then
    ln -s "${BASEDIR}/.pylintrc" ~/.pylintrc
else
    echo "Symbolic link ~/.pylintrc already exists."
fi

# Install 'z' if it doesn't already exist
if [ ! -d ~/src/z/ ]; then
    mkdir -p ~/src/z/
fi
wget "https://raw.githubusercontent.com/rupa/z/master/z.sh" -O ~/src/z/z.sh