#!/bin/bash

function createProject {

  echo "-------------------------"
  echo "cerating project $1"
  echo "-------------------------"

  # copy the single files (not index file)
  find "$scriptPath"/../base/ -type f -maxdepth 1 -not -name "*.html" -exec cp {} . \;

  # create the project structure
  mkdir src
  mkdir src/scripts
  mkdir src/scripts/modules
  mkdir src/styles
  mkdir gulp
  mkdir gulp/tasks
  mkdir dist

  # copy index
  cp "$scriptPath"/../base/index.html ./src/

  # copy over the app, not including any modules
  cp "$scriptPath"/../base/scripts/app.js ./src/scripts
  cp "$scriptPath"/../base/styles/app.scss ./src/styles
  cp -r "$scriptPath"/../base/scripts/app ./src/scripts/modules/

  # copy over the gulp tasks
  cp -r "$scriptPath"/../base/gulp-tasks/ ./gulp/tasks/

  # Replace any app name constants in the copied files
  find . -path ./node_modules -prune -o -type f -exec sed -i "" "s/APPNAME/$1/g" {} \;

  # install the node modules
  npm install

  echo "-------------------------"
  echo "done creating project, starting project"
  echo "-------------------------"

  gulp dev
}
