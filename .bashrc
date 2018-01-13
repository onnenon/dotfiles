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

# Prompt
if [ -n "$SSH_CONNECTION" ]; then
export PS1="\[$(tput setaf 10)\]┌─╼ \[$(tput setaf 8)\][\@]\[$(tput setaf 15)\] -\[$(tput setaf 3)\] \u\[$(tput setaf 15)\]@\h [\[$(tput setaf 8)\]\w\[$(tput setaf 15)\]]\n\[$(tput setaf 10)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 10)\]└────╼\[$(tput setaf 12)\] <<\[$(tput setaf 15)\][ssh]\[$(tput setaf 12)\]>>\"; else echo \"\[$(tput setaf 10)\]└╼ \[$(tput setaf 12)\]<<\[$(tput setaf 15)\][ssh]\[$(tput setaf 12)\]>>\"; fi) \[$(tput setaf 7)\]"
else
export PS1="\[$(tput setaf 10)\]┌─╼ \[$(tput setaf 8)\][\@]\[$(tput setaf 15)\] -\[$(tput setaf 3)\] \u\[$(tput setaf 15)\]@\h [\[$(tput setaf 8)\]\w\[$(tput setaf 15)\]]\n\[$(tput setaf 10)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 10)\]└────╼\[$(tput setaf 12)\] >>\"; else echo \"\[$(tput setaf 10)\]└╼ \[$(tput setaf 12)\]>>\"; fi) \[$(tput setaf 7)\]"
fi

trap 'echo -ne "\e[0m"' DEBUG

# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi


#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#fi
