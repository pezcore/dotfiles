#!/bin/zsh

R_USED=false

while getopts ":r" opt; do
    case $opt in
        r)
            R_USED=true
            echo "Careful..."
            ;;
        \?)
            ;;
        :)
            ;;
    esac
done

if [[ $R_USED == "true" ]]; then

    du -d1 -h * ; du -sh

    echo "You are here: "
    echo '\033[1;33m'$(pwd)'\033[0m'

    echo -n "Are you REALLY sure you want to rm ${@}?: "
    read answer
    if echo "$answer" | grep -iq "^y" ;then
        rm ${@}
    else
        echo "Dodged a bullet there..."
    fi
else

    rm ${@}

fi
