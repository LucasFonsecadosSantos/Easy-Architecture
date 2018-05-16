#!/usr/bin/env bash
##
##
##	FRONT END WEB PROJECT MANAGER
##	This script initialize and creates all project directories and
##	verifys if all dependencies are installed.
##
## SCRIPT WRITTEN BY LUCAS FONSECA DOS SANTOS.
##
##
source config/config.sh
reset
echo -e "\e[30;48;5;82m+==================================================+"
echo '+          FRONT END WEB PROJECT MANAGER           +'
echo '+           by Lucas Fonseca dos Santos            +'
echo '+==================================================+'
echo ''
echo 'Script written by Lucas Fonseca dos Santos.'
echo 'lucas@lcfcompany.com.br'${RESET}
echo ''
sleep 2
###############################################################################
### VERIFYING THE DEPENDENCIES												 ##
###############################################################################
if ! [ -x "$(command -v ruby)" ]; then
	echo -e ${ERROR_MESSAGE} "The Ruby package is not installed!" >&2
	#case the system is ubuntu
	if [ -x "$(cat /etc/*-release | grep ubuntu)" ]; then
		sudo apt-get update
		sudo apt-get install ruby
	elif [ -x "$(cat /etc/*-release | grep arch)" ]; then
		#arch linux case
		sudo pacman -S ruby
	elif [ -x "$(cat /etc/*-release | grep fedora)" ]; then
		#Fedora case
		sudo yum -y install ruby
	fi
else
	echo -e ${SUCCESSFULLY_MESSAGE} "Ruby is installed."
fi

if ! [ -x "$(command -v nodejs)" ]; then
	echo -e ${ERROR_MESSAGE} "The NODEjs package is not installed!" >&2
	#case the system is ubuntu
	if [ -x "$(cat /etc/*-release | grep ubuntu)"]; then
		#Ubuntu case
		sudo apt-get update
		sudo apt-get install nodejs
	elif [ -x "$(cat /etc/*-release | grep arch)" ]; then
		#Arch Linux case
		sudo pacman -S nodejs
	elif [ -x "$(cat /etc/*-release | grep fedora)" ]; then
		#Fedora case
		sudo yum -y install nodejs
	fi
else
	echo -e ${SUCCESSFULLY_MESSAGE} "Ruby is installed."
fi

if ! [ -x "$(command -v npm)" ]; then
	echo -e ${ERROR_MESSAGE} "The NPM package is not installed!" >&2
	#case the system is ubuntu
	if [ -x "$(cat /etc/*-release | grep ubuntu)" ]; then
		sudo apt-get update
		sudo apt-get install npm
	elif [ -x "$(cat /etc/*-release | grep arch)" ]; then
		#arch linux case
		sudo pacman -S npm
	elif [ -x "$(cat /etc/*-release | grep fedora)" ]; then
		#Fedora case
		sudo yum -y install npm
	fi
else
	echo -e ${SUCCESSFULLY_MESSAGE} "NPM package manager is installed."
fi

if ! [ -x "$(command -v sass)" ]; then
	echo -e ${ERROR_MESSAGE} "The SASS pre compiler package is not installed!" >&2
	sudo gem install sass
else
	echo -e ${SUCCESSFULLY_MESSAGE} "SASS is installed."
fi

if ! [ -x "$(command -v pug)" ]; then
	echo -e ${ERROR_MESSAGE} "The PUG pre compiler package is not installed!" >&2
	sudo npm install pug-cli -g
else
	echo -e ${SUCCESSFULLY_MESSAGE} "PUG is installed."
fi


###############################################################################
### CREATING THE DIRECTORIES												 ##
###############################################################################
echo ''
echo -e ${INFORM_MESSAGE} "Creating the directories."
mkdir -p $2/$1/src/

if [ -d $2/$1 ]; then
	echo -e ${SUCCESSFULLY_MESSAGE} "The project main directory was successfully created in: ." $2/$1
else
	echo -e ${ERROR_MESSAGE} "There was some problem with the directories creation."
fi

echo ''
echo -e ${INFORM_MESSAGE} "Creating the remaining directories."
echo -e ${INFORM_MESSAGE} "Creating the libs/ directory: $2/$1/ext/sass/libs/."
mkdir -p $2/$1/src/ext/sass/libs
echo -e ${SUCCESSFULLY_MESSAGE} "Done {!$}."
echo -e ${INFORM_MESSAGE} "Creating the css/ directory: $2/$1/ext/css/."
mkdir -p $2/$1/src/ext/css
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the pug/ directory: $2/$1/ext/pug."
mkdir -p $2/$1/src/ext/pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the include/ directory: $2/$1/ext/pug/include/."
mkdir -p $2/$1/src/ext/pug/include
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the php/ directory: $2/$1/ext/php/."
mkdir -p $2/$1/src/ext/php
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the fonts/ directory: $2/$1/ext/fonts/."
mkdir -p $2/$1/src/ext/fonts
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the js/ directory: $2/$1/ext/js/."
mkdir -p $2/$1/src/ext/js
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Creating the img/ directory: $2/$1/ext/img/."
mkdir $2/$1/src/img
echo -e ${SUCCESSFULLY_MESSAGE} "Done."

###############################################################################
### DOWNLOADING THE BOOTSTRAP FRAMEWORK										 ##
###############################################################################
echo ''
echo -e ${INFORM_MESSAGE} "Configuring the files."
echo -e ${INFORM_MESSAGE} "Downloading the bootstrap framework version 4 from github.com/bootstrap."
sudo wget --directory-prefix=$2/$1/src/ext/sass/ http://github.com/twbs/bootstrap/archive/v4.0.0-alpha.6.zip
echo ''
echo -e ${SUCCESSFULLY_MESSAGE} "Download successfully."
echo -e ${INFORM_MESSAGE} "Extracting the bootstrap core files."
echo ''
for entry in "$2/$1/src/ext/sass"/*.zip
do
	sudo unzip -d $2/$1/src/ext/sass $entry
	echo ''
	echo -e ${SUCCESSFULLY_MESSAGE} "Files extracted."
done

###############################################################################
### CREATING THE LIBS DIRECTORY												 ##
###############################################################################
echo ''
echo -e ${INFORM_MESSAGE} "Copying the Bootstrap core files to libs directory."
sudo mv $2/$1/src/ext/sass/bootstrap-4.0.0-alpha.6/scss/* $2/$1/src/ext/sass/libs/
echo -e ${SUCCESSFULLY_MESSAGE} "Files copied."
echo -e ${INFORM_MESSAGE} "Deleting the zip source files."
sudo rm -r $2/$1/src/ext/sass/bootstrap-4.0.0-alpha.6
sudo rm $2/$1/src/ext/sass/v4.0.0-alpha.6.zip
echo -e ${SUCCESSFULLY_MESSAGE} "Zip file deleted."

###############################################################################
### COPYING SOME FILES														 ##
###############################################################################
echo -e ${INFORM_MESSAGE} "Copying the SASS and PUG compiler bash scripts to $2/$1 directory."
sudo cp -avr ./exec_scripts/compile_sass.sh ./exec_scripts/compile_pug.sh $2/$1/
echo -e ${SUCCESSFULLY_MESSAGE} "Compiler bash script files copied!"

###############################################################################
### CREATUBG SOME FILES														 ##
###############################################################################
echo -e ${INFORM_MESSAGE} "Creating some files."
touch $2/$1/src/ext/sass/core.sass
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
touch $2/$1/src/ext/sass/variables.sass
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
touch $2/$1/src/ext/pug/index.pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
touch $2/$1/src/ext/pug/include/footer.pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
touch $2/$1/src/ext/pug/include/header.pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
touch $2/$1/src/ext/pug/include/index_main.pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
touch $2/$1/src/ext/js/core.js
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
touch $2/$1/src/index.html
echo -e ${SUCCESSFULLY_MESSAGE} "Done."

###############################################################################
### WRITING FILES															 ##
###############################################################################
echo -e ${INFORM_MESSAGE} "Making the core.sass file.."
cat ./config/sass_config.txt >> $2/$1/src/ext/sass/core.sass
cat ./config/sass_variable_config.txt >> $2/$1/src/ext/sass/variables.sass
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Making the PUG file."
cat ./config/pug_config.txt >> $2/$1/src/ext/pug/index.pug
echo -e ${SUCCESSFULLY_MESSAGE} "Done."
echo -e ${INFORM_MESSAGE} "Moving to " $1 " directory."
echo ''
echo ''
echo ''
echo -e ${SUCCESSFULLY_MESSAGE} "PAY ATTENTION: YOUR PROJECT DIRECTORY IS $2/$1. "
echo -e ${SUCCESSFULLY_MESSAGE} "THANK YOU FOR USING THIS. "
echo -e ${SUCCESSFULLY_MESSAGE} "ENJOY IT! "
echo -e ${SUCCESSFULLY_MESSAGE} "GOOD BYE!. "
echo -e ${SUCCESSFULLY_MESSAGE} "LUCAS FONSECA DOS SANTOS - Web Developer. "
