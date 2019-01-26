#!/bin/bash


# should have one arg for script directory location
if [ "$#" -ne 1 ]; then
  echo "You must enter exactly 1 command line arguments"
  exit 1
fi
parent_path=$1
# parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# make sure podfile exists; otherwise create it.
"$parent_path"/ignitionSupportingFiles/podScripts/install_pods.sh "$parent_path" "$parent_path"/ignitionSupportingFiles/swiftLintScripts


# integrate .swiftLint.yml
"$parent_path"/ignitionSupportingFiles/swiftLintScripts/add_swiftLint_file.sh "$parent_path"


# make sure the file to be edited is found in expected location.
if [ ! -e *.xcodeproj/*.pbxproj ]
then
  echo "Did not find .pbxproj file. Searched for *.xcodeproj/*.pbxproj from current directory"
  exit 1
fi


# check if SwiftLint already exists somewhere in that file. If so, it's best not to try to add it anymore
if grep -q "SwiftLint" *.xcodeproj/*.pbxproj
then
  echo "SwiftLint build-step already exists. Won't add to xcodeproj. If you disagree, please file a ticket."
  exit 0
else
  echo "SwiftLint build-step does not exist. go ahead and add to xcodeproj"
fi


# run script to add run script.
python "$parent_path"/ignitionSupportingFiles/swiftLintScripts/add_swiftLintBuildStage.py


# todo: make script more easily customizable
# check if script was added. If so, then name the run script.
sought_change='shellScript = "\"${PODS_ROOT}/SwiftLint/swiftlint\" autocorrect; \"${PODS_ROOT}/SwiftLint/swiftlint\"";'
if grep -Fq "$sought_change" *.xcodeproj/*.pbxproj
then
  echo "change found"

  #Name the script
  perl -i -pe 's/swiftlint\\\"\";/swiftlint\\\"\";name=\"SwiftLint\";/g' *.xcodeproj/*.pbxproj
else
  echo "change not found!!!"
fi

echo "SwiftLint runscript was successfully added to pbxproj"
