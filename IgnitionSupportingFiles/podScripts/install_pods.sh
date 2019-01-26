#!/bin/bash

# should have one arg for script directory location
if [ "$#" -ne 2 ]; then
  echo "You must enter exactly 1 command line arguments"
  exit 1
fi
parent_path=$1
pod_list_path=$2
# parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# make sure Podfile exists
"$parent_path"/ignitionSupportingFiles/podScripts/ensure_podfile_existence.sh

while read pod; do
  echo "> analyzing $pod:"
  
  # install pod if not added yet.
  if grep -Fxq "  pod '$pod'" Podfile
  then
    echo "> $pod found in Podfile; won't add to Podfile or install."
  else
    echo "> $pod not found. Will add to Podfile and install."
    ls
    # add pod after first 'do' on new line
    # This should add the podfile under the main target only
    sed -e "1s/do/do pod '$pod'/;t" -e "1,/do/s//do pod '$pod'/" Podfile > NEWFILE; mv NEWFILE Podfile
    perl -i -pe "s/ pod '$pod'/\n  pod '$pod'/" Podfile
  fi
done < "$pod_list_path"/pods

pod install
echo "Pods installed"

# make gemfile for cocoapods
if [ -e Gemfile ] 
then
  exit 0
fi

cat > Gemfile << EOF1
source "https://rubygems.org"

gem "cocoapods"
EOF1
bundle update