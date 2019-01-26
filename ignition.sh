#!/bin/bash


parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
current_directory=`pwd`
current_basename=`basename "$current_directory"`


# make sure running from right folder
"$parent_path"/ignitionSupportingFiles/check_correct_folder.sh


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


