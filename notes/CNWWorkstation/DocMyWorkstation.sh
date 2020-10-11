#!/bin/bash
#A script to document my workstation (workstation as code)

DOCS_DATE="$(date +%m-%d-%Y)"

mkdir "$DOCS_DATE"
mkdir "$DOCS_DATE"/sources-list-save

dpkg --get-selections > "$DOCS_DATE"/InstalledPackaes
rsync -av /etc/apt/sources.list* "$DOCS_DATE"/sources-list-save
docker images|awk '{print $1" "$2}' > "$DOCS_DATE"/dockerImagesList
code --list-extensions > "$DOCS_DATE"/vscodeExtensions
