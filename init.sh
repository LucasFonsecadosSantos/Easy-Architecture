##	FRONT END WEB PROJECT MANAGER
##	This script initialize and creates all project directories and
##	verifys if all dependencies are installed.
##
## SCRIPT WRITTEN BY LUCAS FONSECA DOS SANTOS.
reset
echo '+==================================================+'
echo '+          FRONT END WEB PROJECT MANAGER           +'
echo '+           by Lucas Fonseca dos Santos            +'
echo '+==================================================+'
echo ''
echo 'Script written by Lucas Fonseca dos Santos.'
echo 'lucas@lcfcompany.com.br'
echo ''
sleep 2

if ! [ -x "$(command -v sass)" ]; then
	echo '[X] ERROR: The SASS pre compiler package is not installed!' >&2
	exit 1
else
	echo '[ OK] SASS is installed.'
fi

if ! [ -x "$(command -v pug)" ]; then
	echo '[X] ERROR: The PUG pre compiler package is not installed!' >&2
else
	echo '[OK] PUG is installed.'
fi

if ! [ -x "$(command -v ruby)" ]; then
	echo '[X] ERROR: The Ruby package is not installed!' >&2
else
	echo '[OK] Ruby is installed.'
fi

echo ''
echo '[..] Creating the directories'
mkdir -p $HOME/$1/src/

if [ -d $HOME/$1 ]; then
	echo '[OK] The project main directory was successfully created in: ' $HOME/$1
else
	echo '[X] ERROR: There was some problem with the directories creation.'
fi

echo ''
echo '[..] Creating the remaining directories'
mkdir -p $HOME/$1/src/ext/sass/libs
echo '[OK] Directory ' {!$} ' created.'
mkdir -p $HOME/$1/src/ext/css
echo '[OK] Directory ' !$ ' created.'
mkdir -p $HOME/$1/src/ext/pug
echo '[OK] Directory ' !$ ' created.'
mkdir -p $HOME/$1/src/ext/php
echo '[OK] Directory ' !$ ' created.'
mkdir -p $HOME/$1/src/ext/fonts
echo '[OK] Directory ' !$ ' created.'
mkdir -p $HOME/$1/src/ext/js
echo '[OK] Directory ' !$ ' created.'
mkdir $HOME/$1/src/img
echo '[OK] Directory ' !$ ' created.'
echo ''
echo '[..] Configuring the files'
echo '[..] Downloading the Bootstrap version 4'
sudo wget --directory-prefix=$HOME/$1/src/ext/sass/ http://github.com/twbs/bootstrap/archive/v4.0.0-alpha.6.zip
echo '[OK] Download successfully!'
echo '[..] Extracting the Bootstrap core files'

for entry in "$HOME/$1/src/ext/sass"/*.zip
do
	sudo unzip -d $HOME/$1/src/ext/sass $entry
	echo '[OK] Files extracted.'
done

echo '[..] Copying the Bootstrap core files to libs directory.'
sudo mv $HOME/$1/src/ext/sass/bootstrap-4.0.0-alpha.6/scss/* $HOME/$1/src/ext/sass/libs/
echo '[OK] Files copied.'
echo '[..] Deleting the zip source files.'
sudo rm -r $HOME/$1/src/ext/sass/bootstrap-4.0.0-alpha.6
sudo rm $HOME/$1/src/ext/sass/v4.0.0-alpha.6.zip
echo '[OK] Zip file deleted.'
echo '[..] Copying the SASS and PUG compiler bash scripts to ' $HOME/$s1 ' directory.'
sudo cp -avr ./compile_sass.sh ./compile_pug.sh $HOME/$1/
echo '[OK] Compiler files copied!'
