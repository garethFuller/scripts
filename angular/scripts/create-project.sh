#!/bin/bash

function createProject {
  appName=$1
  echo "cerating project $1"
  cp -r "$scriptPath"/../base/index.html .
  exit 1
}
