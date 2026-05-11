#!/bin/bash
# ignoregit.sh, or Ignore-Git!
# Author: Jack Semancik
# Email: jack.semancik@yahoo.com
# License: GNU General Public License v3
# Description: A simple utility for placing a template .gitignore file into the current working directory.
#

template_dir=~/templates
template_file=$template_dir/gitignore-template

if [ ! -d $template_dir ]; then
	echo "Error: no template directory exists at $template_dir!"
	echo "Creating directory at $template_dir ..."
	mkdir $template_dir
	echo "Creating template file..."
	echo "" >> $template_file
elif [ ! -f $template_file ]; then
	echo "Error: no template file exists inside $template_dir!"
	echo "Creating template file..."
	echo "" >> $template_file
fi

if [ ! $1 ]; then
	ignore_path=$PWD
elif [ ! -d $1 ]; then
	echo "Error: $1 is not an existing directory (perhaps you need to create it still)"
	exit 128
else
	ignore_path=$1
fi

if [ ! -f ${ignore_path}/.gitignore ]; then
	cp ~/templates/gitignore-template ${ignore_path}/.gitignore
else
	echo "This command will overwrite the existing .gitignore file at $ignore_path, are you sure you would like to proceed?"
	select strictreply in "Yes" "No"; do
		relaxedreply=${strictreply:-$REPLY}
		case $relaxedreply in
			Yes | yes | y | Y ) cp ~/templates/gitignore-template ${ignore_path}/.gitignore; exit 0;;
			No | no | n | N | NO ) exit 1;;
		esac
	done
fi
