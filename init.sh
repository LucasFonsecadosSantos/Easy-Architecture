#!/usr/bin/env bash
##	FRONT END WEB PROJECT MANAGER
##	This script initialize and creates all project directories and
##	verifys if all dependencies are installed.
##
## SCRIPT WRITTEN BY LUCAS FONSECA DOS SANTOS.
# Reset
source config/config.sh
reset
echo -e "\e[30;48;5;82m+==================================================+"
echo '+          FRONT END WEB PROJECT MANAGER           +'
echo '+           by Lucas Fonseca dos Santos            +'
echo '+==================================================+'
echo ''
echo 'Script written by Lucas Fonseca dos Santos.'
echo 'lucas@lcfcompany.com.br ${RESET}'
echo ''
sleep 2
###############################################################################
### VERIFYING THE DEPENDENCIES												 ##
###############################################################################
if ! [ -x "$(command -v ruby)" ]; then
	echo -e ${ERROR_MESSAGE} "The Ruby package is not installed!" >&2
	#case the system is ubuntu
	if [ -x "$(uname -a | grep ubuntu)" ]; then
		sudo apt-get update
		sudo apt-get install ruby
	else if [ -x "$(uname -a | grep arch)" ]; then
		sudo pacman -S ruby
	fi
else
	echo -e ${SUCCESSFULLY_MESSAGE} "Ruby is installed."
fi

if ! [ -x "$(command -v nodejs)" ]; then
	echo -e ${ERROR_MESSAGE} "The NODEjs package is not installed!" >&2
	#case the system is ubuntu
	if [ -x "$(uname -a | grep ubuntu)"]; then
		sudo apt-get update
		sudo apt-get install nodejs
	else if [ -x "$(uname -a | grep arch)" ]; then
		sudo pacman -S nodejs npm
	fi
else
	echo -e ${SUCCESSFULLY_MESSAGE} "Ruby is installed."
fi

if ! [ -x "$(command -v sass)" ]; then
	echo -e ${ERROR_MESSAGE} "The SASS pre compiler package is not installed!" >&2
	sudo gem install sass
else
	echo -e ${SUCCESSFULLY_MESSAGE} "SASS is installed."
fi

if ! [ -x "$(command -v pug)" ]; then
	echo -e ${ERROR_MESSAGE} "The PUG pre compiler package is not installed!" >&2
	npm install pug-cli -g
else
	echo -e ${SUCCESSFULLY_MESSAGE} "PUG is installed."
fi


###############################################################################
### CREATING THE DIRECTORIES												 ##
###############################################################################
echo ''
echo -e ${INFORM_MESSAGE} "Creating the directories."
mkdir -p $HOME/$1/src/

if [ -d $HOME/$1 ]; then
	echo -e ${SUCCESSFULLY_MESSAGE} "The project main directory was successfully created in: ." $HOME/$1
else
	echo -e ${ERROR_MESSAGE} "There was some problem with the directories creation."
fi

echo ''
echo -e ${INFORM_MESSAGE} "Creating the remaining directories."
echo -e ${INFORM_MESSAGE} "Creating the libs/ directory: $HOME/$1/ext/sass/libs/."
mkdir -p $HOME/$1/src/ext/sass/libs
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the css/ directory: $HOME/$1/ext/css/."
mkdir -p $HOME/$1/src/ext/css
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the pug/ directory: $HOME/$1/ext/pug."
mkdir -p $HOME/$1/src/ext/pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the include/ directory: $HOME/$1/ext/pug/include/."
mkdir -p $HOME/$1/src/ext/pug/include
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the php/ directory: $HOME/$1/ext/php/."
mkdir -p $HOME/$1/src/ext/php
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the fonts/ directory: $HOME/$1/ext/fonts/."
mkdir -p $HOME/$1/src/ext/fonts
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the js/ directory: $HOME/$1/ext/js/."
mkdir -p $HOME/$1/src/ext/js
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the img/ directory: $HOME/$1/ext/img/."
mkdir $HOME/$1/src/img
echo -e ${SUCCESSFULLY_MESSAGE} "Done."

###############################################################################
### DOWNLOADING THE BOOTSTRAP FRAMEWORK										 ##
###############################################################################
echo ''
echo -e ${INFORM_MESSAGE} "Configuring the files."
echo -e ${INFORM_MESSAGE} "Downloading the bootstrap framework version 4 from github.com/bootstrap."
sudo wget --directory-prefix=$HOME/$1/src/ext/sass/ http://github.com/twbs/bootstrap/archive/v4.0.0-alpha.6.zip
echo -e ${SUCCESSFULLY_MESSAGE} "Download successfully."
echo -e ${INFORM_MESSAGE} "Extracting the bootstrap core files."
echo ''
for entry in "$HOME/$1/src/ext/sass"/*.zip
do
	sudo unzip -d $HOME/$1/src/ext/sass $entry
	echo -e ${SUCCESSFULLY_MESSAGE} "Files extracted."
done

###############################################################################
### CREATING THE LIBS DIRECTORY												 ##
###############################################################################
echo ''
echo -e ${INFORM_MESSAGE} "Copying the Bootstrap core files to libs directory."
sudo mv $HOME/$1/src/ext/sass/bootstrap-4.0.0-alpha.6/scss/* $HOME/$1/src/ext/sass/libs/
echo -e ${SUCCESSFULLY_MESSAGE} "Files copied."
echo -e ${INFORM_MESSAGE} "Deleting the zip source files."
sudo rm -r $HOME/$1/src/ext/sass/bootstrap-4.0.0-alpha.6
sudo rm $HOME/$1/src/ext/sass/v4.0.0-alpha.6.zip
echo -e ${SUCCESSFULLY_MESSAGE} "Zip file deleted."

###############################################################################
### COPYING SOME FILES														 ##
###############################################################################
echo -e ${INFORM_MESSAGE} "Copying the SASS and PUG compiler bash scripts to $HOME/$1 directory."
sudo cp -avr ./exec_scripts/compile_sass.sh ./exec_scripts/compile_pug.sh $HOME/$1/
echo -e ${SUCCESSFULLY_MESSAGE} "Compiler bash script files copied!"

###############################################################################
### CREATUBG SOME FILES														 ##
###############################################################################
echo -e ${INFORM_MESSAGE} "Creating some files."
touch $HOME/$1/src/ext/sass/core.sass
touch $HOME/$1/src/ext/sass/variables.sass
touch $HOME/$1/src/ext/pug/index.pug
touch $HOME/$1/src/ext/pug/include/footer.pug
touch $HOME/$1/src/ext/pug/include/header.pug
touch $HOME/$1/src/ext/pug/include/index_main.pug
touch $HOME/$1/src/ext/js/core.js

###############################################################################
### WRITING FILES															 ##
###############################################################################
echo -e ${INFORM_MESSAGE} "Making the core.sass file.."
cat ./config/sass_config.txt >> $HOME/$1/src/ext/sass/core.sass
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Making the PUG file."
cat ./config/pug_config.txt >> $HOME/$1/src/ext/pug/index.pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
