#!/bin/bash

function createProject {

  log "creating project $1"

  # create the project folder and change into it
  kebabCase=$( kebabCase $1 )
  mkdir $kebabCase
  cd $kebabCase

  # copy the single files (not index file)
  find "$scriptPath"/base/ -type f -maxdepth 1 -exec cp {} . \;

  # create the project structure
  mkdir app
  mkdir app/components
  touch app/components/.gitkeep
  mkdir app/interfaces
  touch app/interfaces/.gitkeep
  mkdir app/mocks
  touch app/mocks/.gitkeep
  mkdir app/pipes
  touch app/pipes/.gitkeep
  mkdir app/services
  touch app/services/.gitkeep
  mkdir app/styles

  # copy over remaining app files
  cp "$scriptPath"/base/app/styles/styles.css ./app/styles/
  cp "$scriptPath"/base/app/index.ts ./app/
  cp -r "$scriptPath"/base/app/components/app ./app/components/

  # Replace any app name constants in the copied files
  find . -path ./node_modules -prune -o -type f -exec sed -i "" "s/APPNAME/$1/g" {} \;

  # install the node modules
  npm install

  # start the beast
  npm start

  log "done creating project"
}
