#!/usr/bin/env sh
STOW_FOLDERS="nvim"

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g"); do
  echo "stow $folder"
  stow $folder
done
