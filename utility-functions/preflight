function preflight()
{

#Common things I check for in the scripts I write.

curr_host=$(hostname)
curr_user=$USER
host_check=$(echo $curr_host | grep -c <desired hostname>)
user_check=$(echo $curr_user | grep -c <desired username>)

if [ $host_check -ne 1 ]; then
    echo "Must run on <desired host>."
    error_out
fi

if [ $user_check -ne 1 ]; then
    echo "Must run as <desired user>."
    error_out
fi

if [ "$ARG_COUNT" -ne <the right num> ]; then
    help
    error_out
fi

#Your additional stuff here...

}
