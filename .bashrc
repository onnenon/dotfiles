# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi


# Git Branch Info
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


if [[ $- == *i* ]]; then
##### Prompt #####
# SSH Prompt
if [ -n "$SSH_CONNECTION" ]; then
export PS1="\[$(tput setaf 10)\]┌─╼ \[$(tput setaf 3)\][\@]\[$(tput setaf 15)\] -\[$(tput setaf 5)\] \u\[$(tput setaf 6)\]@\h [\[$(tput setaf 15)\]\w\[$(tput setaf 6)\]]\n\[$(tput setaf 10)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 10)\]└────╼\[$(tput setaf 9)\] \$(type -t parse_git_branch >/dev/null && parse_git_branch)\[$(tput setaf 5)\] **\[$(tput setaf 15)\][ssh]\[$(tput setaf 5)\]**\"; else echo \"\[$(tput setaf 10)\]└╼\[$(tput setaf 9)\] \$(type -t parse_git_branch >/dev/null && parse_git_branch)\[$(tput setaf 5)\] **\[$(tput setaf 15)\][ssh]\[$(tput setaf 5)\]**\"; fi) \[$(tput setaf 7)\]"

else
# Normal Prompt
export PS1="\[$(tput setaf 10)\]┌─╼ \[$(tput setaf 3)\][\@]\[$(tput setaf 15)\] -\[$(tput setaf 5)\] \u\[$(tput setaf 6)\]@\h [\[$(tput setaf 15)\]\w\[$(tput setaf 6)\]]\n\[$(tput setaf 10)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 10)\]└────╼\[$(tput setaf 9)\] \$(type -t parse_git_branch >/dev/null && parse_git_branch)\[$(tput setaf 12)\] >>\"; else echo \"\[$(tput setaf 10)\]└╼\[$(tput setaf 9)\] \$(type -t parse_git_branch >/dev/null && parse_git_branch) \[$(tput setaf 12)\]>>\"; fi) \[$(tput setaf 7)\]"
fi

fi

trap 'echo -ne "\e[0m"' DEBUG

# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Change to central time zone 
export TZ="/usr/share/zoneinfo/America/Chicago"


# Aliases

alias gotop="go run github.com/cjbassi/gotop"

