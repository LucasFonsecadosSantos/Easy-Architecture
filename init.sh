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
source ./modules/bash_modules/config.sh
source ./modules/bash_modules/dependencies_checker.sh
source ./modules/bash_modules/directory_builder.sh
clear_console
welcome
sleep 2

###############################################################################
### VERIFYING THE DEPENDENCIES												 ##
###############################################################################
dependencies

###############################################################################
### CREATING THE DIRECTORIES												 ##
###############################################################################
build_directories $1 $2 $3


###############################################################################
### DOWNLOADING THE BOOTSTRAP FRAMEWORK										 ##
###############################################################################
echo ''
msg "Downloading the bootstrap framework version 4 from github.com/bootstrap."
sudo wget --directory-prefix=./$2/$1/src/ext/sass/ https://github.com/twbs/bootstrap/archive/v4.3.1.zip
echo ''
success_msg "Download successfully."
msg "Extracting the bootstrap core files."
echo ''
for entry in "./$2/$1/src/ext/sass"/*.zip
do
    sudo unzip -d $2/$1/src/ext/sass $entry
    echo ''
    success_msg "Files extracted."
done

# ###############################################################################
# ### CREATING THE LIBS DIRECTORY												 ##
# ###############################################################################
echo ''
msg "Copying the Bootstrap core files to libs directory."
sudo mv ./$2/$1/src/ext/sass/bootstrap-4.3.1/scss/* ./$2/$1/src/ext/sass/libs/
success_msg "Files copied."
msg "Deleting the zip source files."
sudo rm -r ./$2/$1/src/ext/sass/bootstrap-4.3.1
sudo rm $2/$1/src/ext/sass/v4.3.1.zip
success_msg "Zip file deleted."


echo ''
echo ''
echo ''
msg "PAY ATTENTION: YOUR PROJECT DIRECTORY IS ./$2/$1. "
sleep 1
msg "THANK YOU FOR USING THIS. "
sleep 1
msg "ENJOY IT! "
sleep 1
msg "GOOD BYE!. "
sleep 1
msg "LUCAS FONSECA DOS SANTOS - Web Developer. "
