#!/bin/bash
set -ueo pipefail

#create programs directory if it doesn't exists
mkdir -p ~/programs

#navigate to programs
cd ~/programs

#clone and build flye
git clone https://github.com/fenderglass/Flye
cd Flye
make

#export to path
export PATH=$HOME/programs/Flye/bin:$PATH
