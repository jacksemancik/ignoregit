#!/bin/bash
# ignoregit.sh, or Ignore-Git!
# Author: Jack Semancik
# Email: jack.semancik@yahoo.com
# License: GNU General Public License v3
# Description: A simple utility for placing a template .gitignore file into the current working directory.
#

if [ ! $1 ]; then
	ignore_path=$PWD
elif [ ! -d $1 ]; then
	echo "Error: $1 is not an existing directory (perhaps you need to create it still)"
	exit 128
else
	ignore_path=$1
fi

cp ~/templates/gitignore-template ${ignore_path}/.gitignore


