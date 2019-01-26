#!/bin/bash

if [ $# -eq 0 ]; then
  echo "You must enter at least 1 command line arguments, being the script to run upon confirmation. You'll want to pass along all other arguments that script needs with this too."
  exit 1
fi


# make sure user is okay with overwriting file if exists
echo -n "
Do you want to run the <$1>? (Yy to continue; anything else to skip) > "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
  echo "skipping"
else
  "$2" "${@:3}"
fi
