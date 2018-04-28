##	FRONT END WEB PROJECT MANAGER
##
##  SCRIPT WRITTEN BY LUCAS FONSECA DOS SANTOS.
##
##  It compiles the SASS files to CSS style files.
reset
echo '+==================================================+'
echo '+          FRONT END WEB PROJECT MANAGER           +'
echo '+           by Lucas Fonseca dos Santos            +'
echo '+==================================================+'
echo ''
sleep 2
echo '+--[SASS COMPILER]---------------------------------+'
echo '[..] Accessing the SASS directory.'
echo '[..] Listing all files.'
COUNTER=1
for entry in "src/ext/sass"/*
do
    echo '['$COUNTER'] ' $entry
    COUNTER=$[$COUNTER +1]
done
echo '+--------------------------------------------------+'
echo ''
reset
echo '+--[COMPILING THE FILES]---------------------------+'
sudo sass --watch src/ext/sass:src/ext/css
echo '+--------------------------------------------------+'