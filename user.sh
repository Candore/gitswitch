#!/bin/sh
source colors.sh

function _set_useremail {
    echo enter secondary user email
    read useremail
    if [ "$useremail" = "" ]; then
        useremailError=${1:-Cannot assign an empty email to user, please retry}
        echo "$RED $useremailError $NC" 
        _set_useremail
    else  
        
        git config --global secondary.email $useremail
        echo "${GREEN}Secondary git user-email set to: $NC"$useremail     
    fi
}

function _set_username {
    echo enter secondary user name
    read username
    if [ "$username" = "" ]; then
        usernameError=${1:-Cannot assign an empty name to user, please retry}
        echo "$RED $usernameError $NC" 
        _set_username
    else
        git config --global secondary.name $username
             echo "${GREEN}Default git user-name set to: $NC"$username
        else 
             SECONDARY_USER_NAME = $username 
             echo "${GREEN}Secondary git user-name set to: $NC"$username
        fi
    fi  
}