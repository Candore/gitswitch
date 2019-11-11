#!/bin/sh

#########################
# usage:  sh init.sh
#
# If you are creating a secondary github user keys for the first time, 
# execute `sh init.sh`. This will prompt you to enter your secondary user info to
# create ssh private and public keys for the newly created user.
#
# Once the key is created, the program automatically switches the secondary user as the default user. 
##
source gswitch.sh #Importing file
source user.sh    #Importing file
source colors.sh

function set_secondary() {
    _set_username
    _set_useremail
    # https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent    
    cd ~/.ssh/ && ssh-keygen -f $(git config --global secondary.name) -t ecdsa -b 521 
    
    echo "add generated key to ssh ssh-add id_rsa$(git config --global secondary.name)"
    echo "copy public key to github ssh settings"
    gswitch
}

function init() {

    if [ $(git config --global secondary.name) ]; then
        gswitch
    else
        set_secondary
    fi
}

init
