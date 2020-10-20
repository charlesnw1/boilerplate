#!/bin/bash

export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

#Variables for this project
source $0-vars

#Boilerplate and support functions
commonIncludeFiles="$(ls -1 --color=none includes/*)"

IFS=$'\n\t'
for file in ${commonIncludeFiles[@]}; do
	. "$file"
done
unset IFS

StrictMode

if [[ project_includes = 1 ]]; then
projectIncludeFiles="$(ls -1 --color=none project-includes/*)"
IFS=$'\n\t'
for file in ${projectIncludeFiles[@]}; do
	. "$file"
done
unset IFS
fi


function main()
{

#Your custom logic here....


}

main
