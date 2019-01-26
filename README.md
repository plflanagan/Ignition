# Ignition
Ignition is a set of tools to get your latest Xcode Project up to speed! No more setting up podfiles or installing Fastlane yet again. Get your project the way you want it -- immediately!


## How to Use
Simply run the script from the directory of your `.xcodeproj` and watch your project get ready to roll!

## Required Installations:
(sudo) pip install pbxproj
(sudo) gem install bundler

### Fastlane:
https://docs.fastlane.tools/getting-started/ios/setup/

Follow steps of `Installing fastlane` and `Setup environment variables`. You do not need to do anything further.

#### Installing Fastlane:
https://docs.fastlane.tools/getting-started/ios/setup/#installing-fastlane

#### Setup environment variables:
https://docs.fastlane.tools/getting-started/ios/setup/#set-up-environment-variables


## Other notes:
If you want SwiftLint, then you do not need to add it to the `pods` file. The pod will get added with the swiftLint setup steps.

## Setup Instructions
There are several files that you will want to update as you would like.

### .swiftLint.yml
If you would like to use SwiftLint, then you will want to update this file as you would like. In the SwiftLint step, it will copy this file for SwiftLint to use in your project.

### pods
This file should list all of the pods you would like to use. If none, then make sure this is empty.
Note: If you are going to use SwiftLint, it will be added automatically when you are running that step; so there is no need to add it to this file.

### pull_request_template.md
If you are going to add a PR Template, then this is the file that will be used as the template. Feel free to modify as you like.
