#!/bin/bash

function createComponent {

  checkRoot

  # store the kebabcase value of the component name and the normal val
  kebabCase=$( kebabCase $1 )

  # first check if an item with the same name already exists
  checkIfExists 'components' $kebabCase

  # name of the component
  class=$( ucFirst $1 )

  # add the component to the router
  addRoute $kebabCase $class

  #copy over the component and use sed to replace the strings
  mkdir app/components/"$kebabCase"
  cp -r "$scriptPath"/base/app/components/component/ ./app/components/"$kebabCase"

  #replace the constants
  replaceIn ./app/components/"$kebabCase" "COMPONENT_NAME" "$kebabCase"
  replaceIn ./app/components/"$kebabCase" "COMPONENT_CLASS_NAME" "$class"

  log "component $1 created"

}
