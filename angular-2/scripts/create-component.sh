#!/bin/bash

function createComponent {

  libName=$2

  checkRoot

  # store the kebabcase value of the component name and the normal val
  kebabCase=$( kebabCase $1 )

  # first check if an item with the same name already exists
  checkIfExists 'components' $kebabCase

  # name of the component
  class=$( ucFirst $1 )

  # Check for the optional argument to allow us to create a
  # component in a lib
  if [ $libName ]; then
    libKabab=$( kebabCase $2 )
    newPath="app/lib/$libKabab/components/$kebabCase"
  else
    newPath="app/components/$kebabCase"
    # add the component to the router
    addRoute $kebabCase $class
  fi

  #copy over the component and use sed to replace the strings
  mkdir $newPath
  cp -r "$scriptPath"/base/app/components/component/ ./"$newPath"

  #replace the constants
  replaceIn ./"$newPath" "COMPONENT_NAME" "$kebabCase"
  replaceIn ./"$newPath" "COMPONENT_CLASS_NAME" "$class"
  replaceIn ./"$newPath" "COMPONENT_PATH" "$newPath"

  log "component $1 created"

}
