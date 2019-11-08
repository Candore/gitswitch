#!/bin/sh
source user.sh #Importing file

function gswitch {

    tempname=$(git config --global user.name)
    tempemail=$(git config --global user.email)
    git config --global user.name $(git config --global secondary.name)
    git config --global user.email $(git config --global secondary.email)
    git config --global secondary.name $tempname
    git config --global secondary.email $tempemail
     
    add_id_rsa_to_ssh $(git config --global user.name)
}

function add_id_rsa_to_ssh {    
    if [ $(find ~/.ssh -iname \*"$1") ]; then ## pattern matching file name - case insensitive,  with the given input to see if it exisits in ssh       
        echo "file found: $(echo $(find ~/.ssh -iname \*"$1" -execdir echo '{}' ';');)" 
        cd ~/.ssh/ && ssh-add $(echo $(find ~/.ssh -iname \*"$1" -execdir echo '{}' ';');) # delete all keys in the agent and add new
    else #file does not exist
        cd ~/.ssh/ && ssh-add id_rsa #add default ssh id if a secondary is not found.
    fi
}

function set_secondary {
    _set_useremail
    _set_username 
}

function init {

if [ $(git config --global secondary.name) ]; then
   gswitch
else
   set_secondary
fi
}

init
