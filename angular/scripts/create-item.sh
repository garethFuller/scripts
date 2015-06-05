#!/bin/bash

# this function is used by all the scripts like create service, create factory etc
# because of this we have a few arguments
function createItem {

  # get the values passed for the new item
  itemName=$1
  itemType=$2
  # optional extra files that we may want to send, like the template in directive
  singleFiles=$3
  replaceWith=$4

  # store the kebabcase value of the directive name
  kebabCase=$( kebabCase $itemName )
  itemNameUcFirst=$( ucFirst "$itemType" )

  # first check if an item with the same name already exists
  checkIfExists $kebabCase $itemName $itemNameUcFirst

  # then make sure they are in the right folder location for the operations
  checkRoot

  # ask the user what type of item they would like to create
  checkIFStandAlone "$itemType"

  if [ $standAlone == "y" ] ; then

    module="$kebabCase"

    # copy over the files and create the structure
    mkdir src/scripts/modules/"$module"
    cp -r "$scriptPath"/base/scripts/"$itemType"/ ./src/scripts/modules/"$module"

    # add the module to the app
    appendModule $kebabCase

  else

    log "Please select a module"

    # ask the user which module they would like to create the item in
    module=$( selectModule )

    if [ "$module" == "" ] ; then
      log "No modules exist please create one first"
      exit 1
    fi

    # loop through the single files and create the items (extra files)
    if [ $singleFiles ] ; then
      for i in "${singleFiles[@]}"
      do
        cp "$scriptPath"/base/scripts/"$itemType"/"$i" ./src/scripts/modules/"$module"
      done
    fi

    # copy the main file (this could be a directive service etc)
    cp "$scriptPath"/base/scripts/"$itemType"/"$itemType".js ./src/scripts/modules/"$module"

    # add the require to the config for the module
    echo "require('./"$itemName$itemNameUcFirst".js');" >> ./src/scripts/modules/"$module"/index.js
     
  fi

  #replace the constants
  replaceIn ./src/scripts/modules/"$module" "CONSTANTONE" "$itemName"
  replaceIn ./src/scripts/modules/"$module" "CONSTANTTWO" "$kebabCase"

  # rename the extra files
  if [ $singleFiles ] ; then
    for i in "${!singleFiles[@]}";
    do
      # get extension of file
      extension=${singleFiles[$i]##*.}
      mv ./src/scripts/modules/"$module"/"${singleFiles[$i]}" ./src/scripts/modules/"$module"/"${!replaceWith[$i]}.${extension}"
    done
  fi

  # rename the main type file
  mv ./src/scripts/modules/"$module"/"$itemType".js ./src/scripts/modules/"$module"/"$itemName$itemNameUcFirst.js"

  log "$itemType $itemName created"
}