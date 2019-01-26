from pbxproj import XcodeProject
import sys
import os
import fnmatch

xcodeprojs = []
for file in os.listdir('.'):
    if fnmatch.fnmatch(file, '*.xcodeproj'):#project.pbxproj'):
    	xcodeprojs.append(file)

if len(xcodeprojs) is 0:
	print('No xcodeproj was found. Ensure you are running in the same directory as it.')
	exit(1)

if len(xcodeprojs) > 1:
	print('Multiple xcodeproj found. Script will run on all of them.')

for xcodeproj in xcodeprojs:
	project = XcodeProject.load('{}/project.pbxproj'.format(xcodeproj))
	project.add_run_script('"${PODS_ROOT}/SwiftLint/swiftlint" autocorrect; "${PODS_ROOT}/SwiftLint/swiftlint"', insert_before_compile=True)
	project.save()
