#!/bin/sh
source gswitch.sh #Importing file
source user.sh    #Importing file

function set_secondary() {
    _set_username
    _set_useremail
}

function init() {

    if [ $(git config --global secondary.name) ]; then
        gswitch
    else
        set_secondary
    fi
}

init
