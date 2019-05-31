# Assignment in Telecommunication Software
# Project 411-w16
## Instructions
Create GITHUB REPO **411-w16** exposing student's work progress
* Performance Measures in Telecommunications
    * Volume/Time
* Data transfer performance measure using "**_time_**" command
* Organise the experiment on two different scales:
    * copy files with specified size to another folder in the same system
    * copy files with **specified size** to another system **over the network** using "**nc**" tool and two distinguished protocols:
        * UDP
        * TCP
* Simultaneously, capture network traffic utilising TCPDUMP library (bash, Python, C++ or Java)

## Requirements
### Python requirements
The following specifications are needed in order to execute the script:
* Python3
* Shutil (OS)
* Subprocess
* Matplotlib

### Bash requirements
The following specifications are needed in order to execute the script:
* Authorization to create and modify files
* Authorization to launch subprocesses from Python
* AWK

## Launch the script
Only the Python file needs to be executed, the bash file will follow automatically
The user can launch the script with the following command:
```
$ python3 time.py
```
The program will ask for a user input to know how to transfer the files and then automatically launch the bash scripts.

**Warning**: This program needs approximatively 15Go of storage (which will be freed after exection), make sure to have enough storage beforehand.
