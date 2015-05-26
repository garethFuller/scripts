#!/bin/bash

function createModule {

  # first check to make sure they have a package.json file at this location
  # ... this at least indicates we ar at the root of the application
  if [ ! -s "./package.json" ] ; then
    echo "Unable to find package json file, please create project first"
    exit 1
  fi

  # store the kebabcase value of the module name and the normal val
  kebabCase=$( kebabCase $1 )
  # name of the module
  controller=$( ucFirst $1 )
  # path to the module in ui router (first seg of the kebab case)
  path=$( firstChunkHyphen $kebabCase )

  #copy over the module and use sed to replace the strings
  mkdir src/scripts/modules/"$kebabCase"
  cp -r "$scriptPath"/base/scripts/module/ ./src/scripts/modules/"$kebabCase"

  #replace the constants
  replaceIn ./src/scripts/modules/"$kebabCase" "PATH" "$path"
  replaceIn ./src/scripts/modules/"$kebabCase" "MODNAME" "$kebabCase"
  replaceIn ./src/scripts/modules/"$kebabCase" "CONTROLERNANE" "$controller"

  # rename the template
  mv ./src/scripts/modules/"$kebabCase"/template.html ./src/scripts/modules/"$kebabCase"/"$kebabCase".html

  #rename the controller
  mv ./src/scripts/modules/"$kebabCase"/controller.js ./src/scripts/modules/"$kebabCase"/"$controller"Ctrl.js

  # add the module to the app
  injectAtLine 4 "\ \ require('../$kebabCase').name," ./src/scripts/modules/app/index.js
}
