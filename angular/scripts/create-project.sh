#!/bin/bash

function createProject {

  echo "-------------------------"
  echo "cerating project $1"
  echo "-------------------------"

  # copy the single files
  find "$scriptPath"/../base/ -type f -maxdepth 1 -exec cp {} . \;

  # create the project structure
  mkdir scripts
  mkdir scripts/modules

  # copy over the app, not including any modules
  cp "$scriptPath"/../base/scripts/app.js ./scripts
  cp -r "$scriptPath"/../base/scripts/app ./scripts/modules/

  # Replace any app name constants in the copied files
  find ./ -type f -exec sed -i "" "s/APPNAME/$1/g" {} \;

  # install the node modules
  npm install

  echo "-------------------------"
  echo "done creating project"
  echo "-------------------------"
}
