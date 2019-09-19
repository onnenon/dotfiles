# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Colored prompt
# force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi


# Git Branch Info
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


if [[ $- == *i* ]]; then
# Colors
# Dark colors 0 - 7
# Light Colors 8 - 15
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
##### Prompt #####
# SSH Prompt
if [ -n "$SSH_CONNECTION" ]; then
export PS1="\[$YELLOW\][\@]\[$WHITE\] -\[$MAGENTA\] \u\[$CYAN\]@\H[\[$WHITE\]\w\[$CYAN\]]
\$(if [[ \$? == 0 ]]; then echo \"\[$GREEN\]\$\
(parse_git_branch)\[$MAGENTA\] **\[$WHITE\][ssh]\[$MAGENTA\]**\"; else echo \"\[$GREEN\] \$\
(parse_git_branch)\[$MAGENTA\] **\[$WHITE\][ssh]\[$MAGENTA\]**\"; fi) \[$WHITE\]"
else
# Normal Prompt
export PS1="\[$YELLOW\][\@]\[$WHITE\] -\[$MAGENTA\] \u\[$CYAN\]@\H[\[$WHITE\]\w\[$CYAN\]]
\$(if [[ \$? == 0 ]]; then echo \"\[$RED\]\$\
(parse_git_branch) \[$GREEN\]>>\"; else echo \"\[$RED\]\$\
(parse_git_branch) \[$GREEN\]>>\"; fi) \[$WHITE\]"
fi
fi

# Alias for colored ls outout.
alias ls='ls -GF --group-directories-first --color'
# alias ls='gls -F --color -h --group-directories-first'

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
set -o vi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
