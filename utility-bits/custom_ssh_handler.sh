function custom_ssh()
{
CUSTOMSSH_USER=$1
CUSTOMSSH_HOST=$2
CUSTOMSSH_COMMAND=$3

SSH_TARGET="$CUSTOMSSH_USER@$CUSTOMSSH_HOST"
ssh -q -t -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_TARGET "$CUSTOMSSH_COMMAND"
}

