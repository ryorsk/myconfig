#!/bin/sh
git pull origin master
cd config
for configfile in .?*; do
    case $configfile in
        *.elc)
            continue;;
        ..)
            continue;;
        .git)
            continue;;
        *)
            ln -Fis "$PWD/$configfile" $HOME
            ;;
    esac
done
