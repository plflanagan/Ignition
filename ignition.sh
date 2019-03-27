#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

final_message="
All setup!!!

Todo checklist:
"

# Check if makePod is specified
if [ "$#" == 2 ]; then
  if [ "$1" == "--makePod" ]; then
  	"$parent_path"/dev.sh "$2"

  	# The folder paths will need to be updated for the below if the above was executed
  	cd "$2"/Example

  	final_message= "${final_message}
[] REMINDER: On 'Pod::Spec.new do |s| in your podspec, you likely need to add 's.swift_version = 4.2'
[] REMINDER: You may need to update the sources too.
[] REMINDER: Run 'pod lib lint $2.podspec' when entire script is done to verify that everything is setup properly.
[] REMINDER: Since you created the project this way, you likely will need to set the origin for git.
[] Have you created the pod and spec github repos?
[] REMINDER: Remember to make the pod and spec repos on github and then add the specRepo with 'pod repo add [REPO_NAME] [SOURCE_URL]'
[] REMINDER: You will need to change the swiftLint script to the developmentDirectory not to ignore '- ../$2'
"
  fi
fi

echo "$final_message"

# make sure running from right folder
"$parent_path"/ignitionSupportingFiles/check_correct_folder.sh
current_directory=`pwd`
current_basename=`basename "$current_directory"`

# Check if git initialized and whether user wants to initialize git


# Install Pods
# "$parent_path"/install_pods.sh "$parent_path"
step_name="Install Standard Pods Step"
script="$parent_path"/ignitionSupportingFiles/podScripts/install_pods.sh # requires 2 param
"$parent_path"/ignitionSupportingFiles/confirm_script.sh "$step_name" "$script" "$parent_path" "$parent_path"


# add swiftlint build step.
# "$parent_path"/add_swiftLint_build_stage.sh "$parent_path"
step_name="Install Standard SwiftLint Step"
script="$parent_path"/ignitionSupportingFiles/swiftLintScripts/add_swiftLint_build_stage.sh # requires 1 param
"$parent_path"/ignitionSupportingFiles/confirm_script.sh "$step_name" "$script" "$parent_path"


# delete storyboard and use code option


# add PR template for github
# "$parent_path"/integrate_pr_template.sh "$parent_path" "$current_basename"
step_name="Integrate/Update Standard PR Template Step"
script="$parent_path"/ignitionSupportingFiles/prTemplateScripts/integrate_pr_template.sh # requires 2 param
"$parent_path"/ignitionSupportingFiles/confirm_script.sh "$step_name" "$script" "$parent_path" "$current_basename"


# add any standard fastlane setups
step_name="Integrate Fastlane Step"
script="$parent_path"/ignitionSupportingFiles/fastlane/integrate_fastlane.sh
"$parent_path"/ignitionSupportingFiles/confirm_script.sh "$step_name" "$script" # "$parent_path" "$current_basename"


# # add localization


# # create standard branches


# echo "$final_message"