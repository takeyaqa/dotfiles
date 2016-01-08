#!/usr/bin/env bash

brew tap homebrew/versions

brew update

brew install readline
brew install openssl
brew install pkg-config
brew install git
brew install tig
brew install mercurial
brew install ctags
brew install tree
brew install tmux
brew install gibo
brew install gist
brew install wget --with-iri
brew install curl --with-libidn
brew install sqlite

brew install python3
brew install rbenv
brew install groovy --with-invokedynamic
brew install gradle
brew install maven
brew install scala --with-src
brew install sbt
brew install nodebrew --HEAD
brew install heroku-toolbelt
brew install postgresql
brew install casperjs --devel
brew install reattach-to-user-namespace
brew install xctool
brew install ideviceinstaller

brew cleanup
