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

dependencies () {
    declare -A osInfo;
    osInfo[/etc/redhat-release]=yum
    osInfo[/etc/arch-release]=pacman
    osInfo[/etc/gentoo-release]=emerge
    osInfo[/etc/SuSE-release]=zypp
    osInfo[/etc/debian_version]=apt-get
    HOST_FILE=/etc/hosts
    SERVICE="ruby"
    PACKAGE_MANAGER=${osInfo[$f]}
    for f in ${!osInfo[@]}
    do
        if [[ -f $f ]]; then
            msg "Package manager: ${PACKAGE_MANAGER}"
            if ! [ -x "$(command -v unzip)" ]; then
                error_msg 'You do not have Unzip package installed.'
                msg 'The Unzip installation process will be started.'
                if [ $f == "/etc/arch-release" ]; then
                    sudo pacman -Sy unzip
                elif [ $f == "/etc/redhat-release" ]; then
                    sudo yum update
                    sudo yum install unzip
                elif [ $f == "/etc/gentoo-release" ]; then
                    sudo emerge --sync
                    sudo emerge --update world
                    sudo emerge --ask dev-lang/unzip
                elif [ $f == "/etc/SuSE-release" ]; then
                    sudo sudo zypper install unzip
                elif [ $f == "/etc/debian-release" ]; then
                    sudo apt update && apt upgrade
                    sudo apt install unzip
                fi
                success_msg 'Unzip package has been installed.'
            else
                success_msg 'Unzip package checked.'
            fi
            if ! [ -x "$(command -v wget)" ]; then
                error_msg 'You do not have Wget package installed.'
                msg 'The Wget installation process will be started.'
                if [ $f == "/etc/arch-release" ]; then
                    sudo pacman -Sy wget
                elif [ $f == "/etc/redhat-release" ]; then
                    sudo yum update
                    sudo yum install wget
                elif [ $f == "/etc/gentoo-release" ]; then
                    sudo emerge --sync
                    sudo emerge --update world
                    sudo emerge --ask dev-lang/ruby
                elif [ $f == "/etc/SuSE-release" ]; then
                    sudo sudo zypper install wget
                elif [ $f == "/etc/debian-release" ]; then
                    sudo apt update && apt upgrade
                    sudo apt install wget
                fi
                success_msg 'Wget package has been installed.'
            else
                success_msg 'Wget package checked.'
            fi
            if ! [ -x "$(command -v ruby)" ]; then
                error_msg 'You do not have Ruby package installed.'
                msg 'The Ruby package installation process will be started.'
                if [ $f == "/etc/arch-release" ]; then
                    sudo pacman -Sy ruby
                elif [ $f == "/etc/redhat-release" ]; then
                    sudo yum update
                    sudo yum install ruby
                elif [ $f == "/etc/gentoo-release" ]; then
                    sudo emerge --sync
                    sudo emerge --update world
                    sudo emerge --ask dev-lang/ruby
                elif [ $f == "/etc/SuSE-release" ]; then
                    sudo sudo zypper install php7 php7-mysql
                elif [ $f == "/etc/debian-release" ]; then
                    sudo apt update && apt upgrade
                    sudo apt install ruby
                fi
                success_msg 'Ruby package dependency has been installed.'
            else
                success_msg 'Ruby package checked.'
            fi
            #NODEJS
            if ! [ -x "$(command -v node)" ]; then
                error_msg 'You do not have Nodejs package installed.'
                msg 'The NodeJS installation process will be started.'
                if [ $f == "/etc/arch-release" ]; then
                    sudo pacman -Sy nodejs
                elif [ $f == "/etc/redhat-release" ]; then
                    sudo yum update
                    yum install -y gcc-c++ make
                    curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
                    sudo yum install nodejs
                elif [ $f == "/etc/gentoo-release" ]; then
                    sudo emerge --sync
                    sudo emerge --update world
                    sudo emerge --ask net-libs/nodejs
                elif [ $f == "/etc/SuSE-release" ]; then
                    sudo sudo zypper install nodejs
                elif [ $f == "/etc/debian-release" ]; then
                    sudo apt update && apt upgrade
                    sudo apt install nodejs
                fi
                msg 'NodeJS package dependency has been installed.'
            else
                success_msg 'NodeJS package checked.'
            fi
            #NPM
            if ! [ -x "$(command -v npm)" ]; then
                error_msg 'You do not have NPM package installed.'
                msg 'The NPM package installation process will be started.'
                if [ $f == "/etc/arch-release" ]; then
                    sudo pacman -Sy npm
                elif [ $f == "/etc/redhat-release" ]; then
                    sudo yum update
                    sudo yum install npm
                elif [ $f == "/etc/gentoo-release" ]; then
                    sudo emerge --sync
                    sudo emerge --update world
                    sudo emerge --ask net-libs/nodejs
                elif [ $f == "/etc/SuSE-release" ]; then
                    sudo sudo zypper install npm
                elif [ $f == "/etc/debian-release" ]; then
                    sudo apt update && apt upgrade
                    sudo apt install npm
                fi
                success_msg 'NPM package dependency has been installed.'
            else
                success_msg 'NPM package checked.'
            fi
            #SASS
            if ! [ -x "$(command -v sass)" ]; then
                error_msg 'You do not have SASS package installed.'
                msg 'The SASS installation process will be started.'
                sudo npm install -g sass
                success_msg 'SASS package dependency has been installed.'
            else
                success_msg 'SASS package checked.'
            fi
            #PUG
            if ! [ -x "$(command -v pug)" ]; then
                error_msg 'You do not have PUG package installed.'
                msg 'The PUG package installation process will be started.'
                sudo npm install -g pug-cli
                sudo npm install -g pug
                success_msg 'PUG package dependency has been installed.'
            else
                success_msg 'PUG package checked.'
            fi
            #TYPESCRIPT
            if ! [ -x "$(command -v tsc)" ]; then
                error_msg 'You do not have Typescript package installed.'
                msg 'The Typescript package installation process will be started.'
                sudo npm install -g tsc
                success_msg 'Typescript package dependency has been installed.'
            else
                success_msg 'Typescript package checked.'
            fi
        fi
    done
}