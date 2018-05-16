# FRONT END WEB PROJECT MANAGER
###### A simple bash shell script to make things easier in the front end developer's life.

## About this project
This script initialize and creates all project directories and verifys if all dependencies are installed to develop any web front end project.  

## Geting Started
coming soon

## System Requirements
- Shell Bash
- Ruby
- SASS
- NPM
- PUG

## How to use
In first step, enter the directory:
```
$ cd FrontEnd-WebProject-Manager/
```
Continuing then

```
$ sudo chmod +x init.sh compile_sass.sh compile_pug.sh
$ ./init.sh <project_name> <project_path>
```

Where the project_name is your project name rs.
The project directory will be created in:

```
$ <project_path>/project_name
```
Where project path is your main directory.
For access the project:

```
$ cd <project_path>/project_name
```

## Execute the SASS and PUG compiler
In project directory

```
<project_path>/project_name
```

execute the following bash scripts:

```
$ ./compile_sass.sh
```

and to execute the PUG compiler, you have to open another bash or terminal emulador and you need to execute the other bash script:

```
$ ./compile_pug.sh
```
## Authors
* **Lucas Fonseca dos Santos** - *Computer Science student of Federal University of Lavras* - lucas@lcfcompany.com.br
## License
This project is licensed under no license. Copyleft is freedom!
