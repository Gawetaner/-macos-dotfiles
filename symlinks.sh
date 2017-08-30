#!/usr/bin/env bash

set -eu

# Get the path of this repo, for symlinking we need to use to full path.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

###############################################################################
# Symlink dotfiles.                                                           #
###############################################################################

ln -sf "$DIR/.zshrc" "$HOME/.zshrc"
ln -sf "$DIR/.gemrc" "$HOME/.gemrc"
ln -sf "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DIR/.gitignore_global" "$HOME/.gitignore_global"

###############################################################################
# Symlink bin folder.                                                         #
###############################################################################

rm -rf "$HOME/bin"
ln -s "$DIR/bin" "$HOME/bin"

###############################################################################
# Symlink app settings.                                                       #
###############################################################################

# Sublime Text 3 - Remove the whole "Sublime Text 3" folder first, otherwise Sublime will delete the symlinks.
rm -rf "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p "$HOME/Library/Application Support/Sublime Text 3/Packages"
ln -s "$DIR/AppSettings/Sublime Text 3/Packages/User" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"

# Xcode
rm -rf "$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"
mkdir -p "$HOME/Library/Developer/Xcode/UserData"
ln -s "$DIR/AppSettings/Xcode/FontAndColorThemes" "$HOME/Library/Developer/Xcode/UserData/FontAndColorThemes"

rm -rf "$HOME/Library/Developer/Xcode/UserData/xcdebugger"
mkdir -p "$HOME/Library/Developer/Xcode/UserData"
ln -s "$DIR/AppSettings/Xcode/xcdebugger" "$HOME/Library/Developer/Xcode/UserData/xcdebugger"
