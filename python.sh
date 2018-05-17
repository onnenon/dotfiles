#!/usr/bin/env bash

# pip install virtualenv virtualenvwrapper virtualenv-clone

# test -d "/usr/local/opt/python/libexec/bin" && PATH="/usr/local/opt/python/libexec/bin:${PATH}"

alias rmpyc="find . -name '*.pyc' -exec rm '{}' ';'"
alias pydiff='diff -x .git -x __pycache__ -x *.pyc -x *.coverage -rq'

hash autopep8 &>/dev/null;
if [ $? -eq 0 ]; then
    alias autopep8-agg='autopep8 --in-place --aggressive --aggressive'
fi

hash virtualenv &>/dev/null;
if [ $? -eq 0 ]; then
    export PROJECT_HOME="${HOME}/Documents/onnenon"
    export WORKON_HOME="${PROJECT_HOME}/ENVS"
    export VIRTUAL_ENV_DISABLE_PROMPT=True

    [[ ! -d $WORKON_HOME  ]] && mkdir -p $WORKON_HOME
    [[ ! -d $PROJECT_HOME  ]] && mkdir -p $PROJECT_HOME
fi

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
    # export VIRTUALENVWRAPPER_PYTHON="/usr/local/opt/python/libexec/bin/python"
    # https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html
    source /usr/local/bin/virtualenvwrapper.sh

    alias venv="workon"
    alias venv.exit="deactivate"
    alias venv.ls="lsvirtualenv"
    alias venv.show="showvirtualenv"
    alias venv.init="mkvirtualenv"
    alias venv.rm="rmvirtualenv"
    alias venv.switch="workon"
    alias venv.add="add2virtualenv"
    alias venv.cd="cdproject"
    alias venv.cdsp="cdsitepackages"
    alias venv.cdenv="cdvirtualenv"
    alias venv.lssp="lssitepackages"
    alias venv.proj="mkproject"
    alias venv.setproj="setvirtualenvproject"
    alias venv.wipe="wipeenv"
fi


hash virtualenv-clone &>/dev/null;
if [ $? -eq 0 ]; then
    function venv.cp() {
        if [ -z "${2}" ]; then
            echo "Usage: \`venv.cp existing_venv new_venv\`";
            return 1;
        fi;
        if [ ! -d "${WORKON_HOME}/${1}" ]; then
            echo "Error: virtualenv does not exist - \`${1}\`";
            return 1;
        fi;
        virtualenv-clone "${WORKON_HOME}/${1}" "${WORKON_HOME}/${2}";
        echo "Cloned ${1} as ${2}";
    }
fi


function venv.cmds() {
    echo 'venv: workon'
    echo 'venv.add: add2virtualenv'
    echo 'venv.cd: cdproject'
    echo 'venv.cdenv: cdvirtualenv'
    echo 'venv.cdsp: cdsitepackages'
    echo 'venv.cp: virtualenv-clone'
    echo 'venv.exit: deactivate'
    echo 'venv.init: mkvirtualenv'
    echo 'venv.ls: lsvirtualenv'
    echo 'venv.lssp: lssitepackages'
    echo 'venv.proj: mkproject'
    echo 'venv.rm: rmvirtualenv'
    echo 'venv.setproj: setvirtualenvproject'
    echo 'venv.show: showvirtualenv'
    echo 'venv.switch: workon'
    echo 'venv.wipe: wipeenv'
}