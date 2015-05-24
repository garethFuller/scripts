#!/bin/bash

function createProject {

  echo "-------------------------"
  echo "cerating project $1"
  echo "-------------------------"

  # copy the index file
  cp "$scriptPath"/../base/index.html .

  # create the project structure
  mkdir scripts
  mkdir scripts/modules

  # copy over the app, not including any modules
  cp "$scriptPath"/../base/app.js ./scripts
  cp -r "$scriptPath"/../base/app ./scripts/modules/

  # copy over the package json
  cp "$scriptPath"/../base/package.json .

  # Replace any app name constants in the copied files
  find ./ -type f -exec sed -i "" "s/APPNAME/$1/g" {} \;

  # install the node modules
  npm install

  echo "-------------------------"
  echo "done creating project"
  echo "-------------------------"
}
