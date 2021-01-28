#!/usr/bin/env bash

pushd .;

cd "$(dirname "${BASH_SOURCE}")";

git fetch --all;

git pull origin master;

git commit -am "update" && git push

function copy_and_source() {
  rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude "deploy.sh" \
        --exclude "README.md" \
        -avh --no-perms . ~;
  source ~/.bash_profile;
}

copy_and_source;

unset copy_and_source;

popd;
