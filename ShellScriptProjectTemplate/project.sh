#!/bin/bash

export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'

#Variables for this project
source $0-vars

#Boilerplate and support functions
FrameworkIncludeFiles="$(ls -1 --color=none includes/*)"

IFS=$'\n\t'
for file in ${FrameworkIncludeFiles[@]}; do
	. "$file"
done
unset IFS


if [[ ProjectIncludes = 1 ]]; then
ProjectIncludeFiles="$(ls -1 --color=none project-includes/*)"
IFS=$'\n\t'
for file in ${ProjectIncludeFiles[@]}; do
	. "$file"
done
unset IFS
fi


#####
#Core framework functions...
#####

StrictMode

export ArgCounter="0"
ProgramArguments=("$@")
while [ $ArgCounter -lt $# ]
do
    arg=${ProgramArguments[$ArgCounter]}
    let ArgCounter=ArgCounter+1
    export nextArg=${ProgramArguments[$ArgCounter]}

            argKey="$arg"
            export argVal="$nextArg"
            export skipNext=1

case "$argKey" in
        --blah1)
            key="value"
        ;;
        --blah2)
            key="value"
        ;;
        --blah3)
            key="value"
        ;;
        -h|--help|-help|--h)
            LocalHelp
            exit
        ;;
        
    esac
done

function main()
{

#Your custom logic here....
echo "Custom logic here..."
}

main
