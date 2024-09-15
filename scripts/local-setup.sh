#!/bin/bash
set -e

ATLANTIS_VERSION=v0.29.0
ATLANTIS_PACKAGE=atlantis_darwin_arm64.zip

echo "Download atlantis lib"
wget https://github.com/runatlantis/atlantis/releases/download/${ATLANTIS_VERSION}/${ATLANTIS_PACKAGE}

unzip atlantis_darwin_arm64.zip

echo "Download ngrok"
wget -c https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-darwin-amd64.zip -O - \
        | tar -xz

echo "Generate random secret string"
echo $RANDOM | md5| head -c 20; echo;
