#!/usr/bin/env bash

welcome () {
    echo '################################################################'
    echo '##                                                            ##'
    echo '##                                                            ##'
    echo '##  _____                                                     ##'
    echo '## | ____|__ _ ___ _   _                                      ##'
    echo '## |  _| / _` / __| | | |                                     ##'
    echo '## | |__| (_| \__ \ |_| |                                     ##'
    echo '## |_____\__,_|___/\__, |                                     ##'
    echo '##     _           |___/   _ _            _                   ##'
    echo '##    / \   _ __ ___| |__ (_) |_ ___  ___| |_ _   _ _ __ ___  ##'
    echo '##   / _ \ | '__/ __\| '_ \| | __/ _ \/ __| __| | | | '__/ _ \\ ##'
    echo '##  / ___ \| | | (__| | | | | ||  __/ (__| |_| |_| | | |  __/ ##'
    echo '## /_/   \_\_|  \___|_| |_|_|\__\___|\___|\__|\__,_|_|  \___| ##'
    echo '##                                                            ##'
    echo '##                                                            ##'
    echo '## SCRIPT WRITTEN BY LUCAS FONSECA DOS SANTOS.                ##'
    echo '##                                                            ##'
    echo '################################################################'
}

success_msg () {
    echo -e "${IGREEN}[ ${BIGREEN}OK${IGREEN} ] ${IGREEN}" $1
}

error_msg () {
    echo -e "${IRED}[ ${BIRED}ERROR${IRED} ] " $1
}

msg () {
    echo -e "${IGREEN}[ ${IWHITE}..${IGREEN} ] ${IWHITE}" $1
}

clear_console () {
    reset
}