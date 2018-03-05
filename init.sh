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
	echo '[OK] SASS is installed.'
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
echo '[..] Changing to ' $HOME/$1
cd $HOME/$1
echo '[OK] Directory accessed!'
echo ''
echo '[..] Changing to src/'
cd src
echo '[OK] Directory accessed!'
echo ''
echo '[..] Creating the remaining directories'
mkdir -p ext/sass/libs
echo '[OK] Directory ' !$ ' created.'
mkdir -p ext/css
echo '[OK] Directory ' !$ ' created.'
mkdir -p ext/pug
echo '[OK] Directory ' !$ ' created.'
mkdir -p ext/php
echo '[OK] Directory ' !$ ' created.'
mkdir -p ext/fonts
echo '[OK] Directory ' !$ ' created.'
mkdir -p ext/js
echo '[OK] Directory ' !$ ' created.'
mkdir img
echo '[OK] Directory ' !$ ' created.'
