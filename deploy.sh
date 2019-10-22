#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function copy_and_source() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "deploy.sh" \
        --exclude "README.md" \
        -avh --no-perms . ~;
  source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  copy_and_source;
else
  read -p "This may overwrite existing files in your home directory.  Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    copy_and_source;
  fi;
fi;

unset copy_and_source;
