function gswitch() {

    tempname=$(git config --global user.name)
    tempemail=$(git config --global user.email)
    git config --global user.name $(git config --global secondary.name)
    git config --global user.email $(git config --global secondary.email)
    git config --global secondary.name $tempname
    git config --global secondary.email $tempemail

    add_rsa_id_to_ssh $(git config --global user.name)
}

function add_rsa_id_to_ssh() {
    val=$(echo $1 | tr '[A-Z]' '[a-z]') ## lowercasing input parameter
    if [ $(find ~/.ssh -name \*"$val") ]; then ## pattern matching file name with the given input to see if it exisits in ssh
        file= find ~/.ssh -name \*"$val" -exec basename {} \; ## returns only the base name instead of the full path +name
        echo $file
        cd ~/.ssh/ && ssh-add -D && ssh-add $file  # delete all keys in the agent and add new
    else #file does not exist
        cd ~/.ssh/ && ssh-add -D && ssh-add id_rsa #add default ssh id if a secondary is not found.
    fi
}
gswitch
