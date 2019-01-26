#!/bin/bash

if [ ! -e *.xcodeproj ]
then
  echo "not in correct folder. This should be run from the same folder as your '.xcodeproj' file. Files found at running location:"
  ls
  exit 1
fi