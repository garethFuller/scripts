#!/bin/bash

function checkRoot {
  # first check to make sure they have a package.json file at this location
  # ... this at least indicates we ar at the root of the application
  if [ ! -s "./package.json" ] ; then
    echo "Unable to find package json file, all commands must be made from project root"
    exit 1
  fi
}