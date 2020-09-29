export COUNTER=0
ARGS=("$@")
while [ $COUNTER -lt $# ]
do
    arg=${ARGS[$COUNTER]}
    let COUNTER=COUNTER+1
    export nextArg=${ARGS[$COUNTER]}

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
            usage
            exit
        ;;
        
    esac
done
