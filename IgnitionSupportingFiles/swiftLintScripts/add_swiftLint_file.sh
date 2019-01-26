#!/bin/bash

# should have one arg for parent-script location
if [ "$#" -ne 1 ]; then
  echo "You must enter exactly 1 command line arguments"
  exit 1
fi
parent_path=$1

file=".swiftLint.yml"

if [[ -r ${file} ]]
then
  # file found. 
  # make sure user is okay with overwriting file if exists
  echo -n "
  This will overwrite the $file file; are you sure you want to continue? Type y to continue, or anything else to exit. (y to continue) > "
  read answer
  if [ "$answer" == "${answer#[Yy]}" ] ;then
    echo "did not overwrite $file"
  else
    cp "$parent_path"/"$file" "$file"
  fi
else
  # file not found; copy to folder.
  cp "$parent_path"/"$file" "$file"
fi
