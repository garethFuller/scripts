#!/bin/bash

function createProject {

  log "creating project $1"

  # copy the single files (not index file)
  find "$scriptPath"/base/ -type f -maxdepth 1 -not -name "*.html" -exec cp {} . \;

  # create the project structure
  mkdir app
  mkdir app/components
  mkdir app/interfaces
  mkdir app/mocks
  mkdir app/pipes
  mkdir app/services
  mkdir app/styles

  # copy index
  cp "$scriptPath"/base/index.html ./

  # copy over the app files
  cp "$scriptPath"/base/app/package.json ./
  cp "$scriptPath"/base/app/tsconfig.json ./
  cp "$scriptPath"/base/app/typings.json ./
  cp "$scriptPath"/base/app/index.html ./
  cp "$scriptPath"/base/app/.gitignore ./
  cp "$scriptPath"/base/app/index.ts ./app/
  cp "$scriptPath"/base/app/styles/styles.scss ./app/styles/

  cp -r "$scriptPath"/base/app/component/app ./app/components/

  # Replace any app name constants in the copied files
  find . -path ./node_modules -prune -o -type f -exec sed -i "" "s/APPNAME/$1/g" {} \;

  # install the node modules
  npm install

  # start the beast
  npm start

  log "done creating project"
}
