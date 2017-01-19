#!/bin/bash
# Importing missing keys
# Example: import_key 55F96FCF8231B6DD

sudo gpg --keyserver pgpkeys.mit.edu --recv-key  $1
sudo gpg -a --export $1 | sudo apt-key add -
