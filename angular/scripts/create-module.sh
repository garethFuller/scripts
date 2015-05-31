#!/bin/bash

function createModule {

  checkRoot

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
  appendModule $kebabCase

  echo "-------------------------"
  echo "module $1 created"
  echo "-------------------------"

}
