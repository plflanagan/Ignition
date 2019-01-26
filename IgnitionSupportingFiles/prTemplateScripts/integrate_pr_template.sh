#!/bin/bash

# should have one arg for directory location
if [ "$#" -ne 2 ]; then
  echo "You must enter exactly 2 command line arguments"
  exit 1
fi
directory_path=$1
basename=$2

# if template exists, then copy to project
if [ ! -e "$directory_path"/pull_request_template.md ]
then
  echo "template not found"
  exit 1
fi


# PR template needs to be at level of .git. See if it is nearby.

# see if .git is at current directory
if [ -d .git ]
then
	"$directory_path"/ignitionSupportingFiles/prTemplateScripts/copy_pull_request_template.sh "$directory_path"
else
	# otherwise see if .git is one directory up.
	if [ -d ../.git ]
	then
		cd ..
		"$directory_path"/ignitionSupportingFiles/prTemplateScripts/copy_pull_request_template.sh "$directory_path"
		cd "$basename"
	else
	  # otherwise, give up.
	  echo ".git folder was not found at level of .xcodeproj or one directory above. Will not attempt to look further. Please file a bug and share a screenshot of your directory structure if your .git directory is elsewhere"
	fi
fi
