#!/bin/bash

export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

#Boilerplate and support functions
commonIncludeFiles="$(ls -1 --color=none includes/*)"

IFS=$'\n\t'
for file in ${commonIncludeFiles[@]}; do
	. "$file"
done
unset IFS

#Variables for this project
source $0-vars

LocalHelp
