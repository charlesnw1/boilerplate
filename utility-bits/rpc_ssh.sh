function rpc_ssh() 
{
     if ! args=("$(getopt -l "rmthost:,rmthostport:,rmtlogin:,pushvars:,pushfuncs:,rmtmain:" -o "h:p:u:v:f:m:A" -- "$@")")
    then
        exit 1
    fi

    sshvars=( -q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~jigmaker/jigmaker/keys/TS_root.key )
    eval set -- "${args[@]}"
    while [ -n "$1" ]
    do
        case $1 in
            -h|--rmthost) rmthost=$2; shift; shift;;
            -p|--rmtport) sshvars=( "${sshvars[@]}" -p $2 ); shift; shift;;
            -u|--rmtlogin) rmtlogin=$2; shift; shift;;
            -v|--pushvars) pushvars=$2; shift; shift;;
            -f|--pushfuncs) pushfuncs=$2; shift; shift;;
            -m|--rmtmain) rmtmain=$2; shift; shift;;
            -A) sshvars=( "${sshvars[@]}" -A ); shift;;
            -i) sshvars=( "${sshvars[@]}" -i $2 ); shift; shift;;
            --) shift; break;;
        esac
    done
    rmtargs=( "$@" )

    ssh ${sshvars[@]} ${rmtlogin}@${rmthost} "
        $(declare -p rmtargs 2>/dev/null)
        $([ -n "$pushvars" ] && declare -p $pushvars 2>/dev/null)
        $(declare -f $pushfuncs 2>/dev/null)
        $rmtmain \"\${rmtargs[@]}\"
        #$rmtmain {rmtargs[@]}
    "
}
