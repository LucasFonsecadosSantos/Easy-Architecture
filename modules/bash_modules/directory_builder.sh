#!/usr/bin/env bash
################################################################
##                                                            ##
##                                                            ##
##  _____                                                     ##
## | ____|__ _ ___ _   _                                      ##
## |  _| / _` / __| | | |                                     ##
## | |__| (_| \__ \ |_| |                                     ##
## |_____\__,_|___/\__, |                                     ##
##     _           |___/   _ _            _                   ##
##    / \   _ __ ___| |__ (_) |_ ___  ___| |_ _   _ _ __ ___  ##
##   / _ \ | '__/ __| '_ \| | __/ _ \/ __| __| | | | '__/ _ \ ##
##  / ___ \| | | (__| | | | | ||  __/ (__| |_| |_| | | |  __/ ##
## /_/   \_\_|  \___|_| |_|_|\__\___|\___|\__|\__,_|_|  \___| ##
##                                                            ##
##                                                            ##
## SCRIPT WRITTEN BY LUCAS FONSECA DOS SANTOS.                ##
##                                                            ##
################################################################

source ./modules/bash_modules/gui.sh

build_directories () {
    msg "Creating the ${2}/${1}/src/ ..."
    mkdir -p ./$2/$1/src/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/docs/ ..."
    mkdir -p ./$2/$1/docs/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/ ..."
    mkdir -p ./$2/$1/src/ext/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/sass/ ..."
    mkdir -p ./$2/$1/src/ext/sass/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/sass/libs/ ..."
    mkdir -p ./$2/$1/src/ext/sass/libs/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/pug/ ..."
    mkdir -p ./$2/$1/src/ext/pug/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/pug/modules/ ..."
    mkdir -p ./$2/$1/src/ext/pug/modules/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/pug/components/ ..."
    mkdir -p ./$2/$1/src/ext/pug/components/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/pug/pages/ ..."
    mkdir -p ./$2/$1/src/ext/pug/pages/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/css/ ..."
    mkdir -p ./$2/$1/src/ext/css/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/js/ ..."
    mkdir -p ./$2/$1/src/ext/js/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/typescript/ ..."
    mkdir -p ./$2/$1/src/ext/typescript/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/php/ ..."
    mkdir -p ./$2/$1/src/ext/php/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/ext/fonts/ ..."
    mkdir -p ./$2/$1/src/ext/fonts/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/img/ ..."
    mkdir -p ./$2/$1/src/img/
    success_msg 'Done.'
    msg "Creating the ${2}/${1}/src/index.html ..."
    touch ./$2/$1/src/index.html
    success_msg 'Done.'
    msg "Copying the PUG files to ${2}/${1}/src/ext/pug/ ..."
    cp -avr ./payload/pug/* ./$2/$1/src/ext/pug/
    success_msg 'Done.'
    if [ -d $2/$1 ]; then
        success_msg "The project main directory was successfully created in: ${2}/${1}."
    else
        error_msg "There was some problem with the directories creation."
    fi
    if [ $3 == "default" ]; then
        msg "Default architecture defined."
        msg "Copying SASS payload to ${2}/${1}/sass/ ..."
        cp -avr ./payload/default-architecture/* ./$2/$1/src/ext/sass/
    elif [ $3 == "itcss" ]; then
        msg "ITCSS architecture defined."
        msg "Copying SASS payload to ${2}/${1}/sass/ ..."
        cp -avr ./payload/itcss-architecture/* ./$2/$1/src/ext/sass/
    fi

}