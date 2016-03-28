#!/bin/bash

# this function is used by all the scripts like create service, create factory etc
# because of this we have a few arguments
function createItem {

  # get the values passed for the new item
  itemName=$1
  itemType=$2

  # store the kebabcase value of the directive name
  kebabCase=$( kebabCase $itemName )

  # first check if an item with the same name already exists
  checkIfExists $itemType $kebabCase

  # then make sure they are in the right folder location for the operations
  checkRoot

  # copy over the files and create the structure
  mkdir app/"$itemType"/"$kebabCase"
  cp -r "$scriptPath"/base/app/"$itemType"/ ./app/"$itemType"/"$kebabCase"

  if [ $itemType == "mocks" ] ; then
    ucName=$( toUpper $itemName )
    replaceIn ./app/"$itemType"/"$kebabCase" "MOCK_NAME" "$ucName"

    # Ask for the name of the interface
    while [ "$interfaceName" == "" ]
    do
      echo -n "What is the name of the interface it implements? "
      read interfaceName
    done

    interfaceKabab=$( kebabCase $interfaceName )
    replaceIn ./app/"$itemType"/"$kebabCase" "INTERFCACE_KABAB" "$interfaceKabab"
    replaceIn ./app/"$itemType"/"$kebabCase" "INTERFACE_NAME" "$interfaceName"

  else

    # replace the constants
    replaceIn ./app/"$itemType"/"$kebabCase" "CONSTANTONE" "$itemName"
    replaceIn ./app/"$itemType"/"$kebabCase" "CONSTANTTWO" "$kebabCase"

  fi
}
