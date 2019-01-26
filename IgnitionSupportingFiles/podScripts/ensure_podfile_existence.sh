#!/bin/bash

if [ ! -e Podfile ]
then
  echo "> Podfile not found. Will run 'pod init'"
  pod init
fi
