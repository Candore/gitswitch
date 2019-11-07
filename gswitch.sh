function gswitch {
    
    tempname=$(git config --global user.name) 
    tempemail=$(git config --global user.email)
    git config --global user.name $(git config --global secondary.name)
    git config --global user.email $(git config --global secondary.email)
    git config --global secondary.name $tempname
    git config --global secondary.email $tempemail

    # cat ~/.gitconfig
}

gswitch