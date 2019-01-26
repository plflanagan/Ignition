#!/bin/bash

# should have one arg for directory location
if [ "$#" -ne 1 ]; then
  echo "You must enter exactly 1 command line argument===s"
  exit 1
fi

# if folder exists, see if file exists
if [ -d "docs" ]
then
  if [ -e docs/pull_request_template.md ]
  then
    # file already exists. 
    # make sure user is okay with overwriting file if exists
    echo -n "
    This will overwrite the pull_request_template.md; are you sure you want to continue? Type y to continue, or anything else to exit. (y to continue) > "
    read answer
    if [ "$answer" == "${answer#[Yy]}" ]
    then
      echo "    Did not overwrite pull_request_template.md."
    else
      cp "$1"/pull_request_template.md docs/pull_request_template.md
    fi
  else
    # file not found; copy to folder.
    cp "$1"/pull_request_template.md docs/pull_request_template.md
  fi
else
	# folder doesn't exist. create folder and then add file
	mkdir docs
	cp "$1"/pull_request_template.md docs/pull_request_template.md
fi
