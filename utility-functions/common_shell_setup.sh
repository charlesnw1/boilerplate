function common_shell_setup()
{

# This is a function I include and execute in every shell script that I write. 
# It sets up a bunch of debug/error handling odds and ends

# Sourced from :
# * https://news.ycombinator.com/item?id=24727495
# * https://www.tothenew.com/blog/foolproof-your-bash-script-some-best-practices/
# * http://redsymbol.net/articles/unofficial-bash-strict-mode/
# * https://translucentcomputing.com/2020/05/unofficial-bash-strict-mode-errexit/
# * the school of hard knocks... (aka my code failures...)

#Here's the beef (as the commercial says..)

#use errexit (a.k.a. set -e) to make your script exit when a command fails.
#add || true to commands that you allow to fail.
set -o errexit

# Use set -o nounset (a.k.a. set -u) to exit when your script tries to use undeclared variables.
set -o nounset

#Use set -o pipefail in scripts to catch (for example) mysqldump fails in e.g. mysqldump |gzip. 
#The exit status of the last command that threw a non-zero exit code is returne
set -o pipefail

#While the above can be (per http://redsymbol.net/articles/unofficial-bash-strict-mode/ done via :
#set -euo pipefail , I stronlgy prefer verbosity. Especially in framework code)

#Curn on debug output if the DEBUG_FLAG variable is set to yes
if grep -q yes <<< $DEBUG_FLAG; then

# * print commands to be executed to stderr as if they were read from input (script file or keyboard)
# * print everything before any ( substitution and expansion, …) is applied
set -v

# * print everything as if it were executed, after substitution and expansion is applied
# * indicate the depth-level of the subshell (by default by prefixing a + (plus) sign to the displayed command)
# * indicate the recognized words after word splitting by marking them like 'x y'
# * in shell version 4.1, this debug output can be printed to a configurable file descriptor, rather than sdtout by setting the BASH_XTRACEFD variable.
set -x

fi

}