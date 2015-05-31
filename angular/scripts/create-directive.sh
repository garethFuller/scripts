#!/bin/bash

function createDirective {

  checkRoot

  # user needs to select how they intend to create the module
  while [ "$standAlone" != "y" -a "$standAlone" != "n" ]
  do
    echo -n "Would you like to create the directive as a stand alone module? [y or n]: "
    read standAlone
  done

  # store the kebabcase value of the directive name
  kebabCase=$( kebabCase $1 )
  directiveName=$1

  if [ $standAlone == "y" ] ; then
    # create the stand alone module with the name etc they sent in as args

    # copy over the files and create the structure
    mkdir src/scripts/modules/"$kebabCase"
    cp -r "$scriptPath"/base/scripts/directive/ ./src/scripts/modules/"$kebabCase"

    #replace the constants
    replaceIn ./src/scripts/modules/"$kebabCase" "DIRECTIVENAME" "$directiveName"
    replaceIn ./src/scripts/modules/"$kebabCase" "TEMPLATENAME" "$kebabCase"

    # rename the template
    mv ./src/scripts/modules/"$kebabCase"/template.html ./src/scripts/modules/"$kebabCase"/"$kebabCase".html

    #rename the directive file
    mv ./src/scripts/modules/"$kebabCase"/directive.js ./src/scripts/modules/"$kebabCase"/"$directiveName".js

    # add the module to the app
    appendModule $kebabCase

    echo "-------------------------"
    echo "directive $1 created"
    echo "-------------------------"

  else
    # if we are here we are creating the directive as part of an existing module

    # ask the user for the name of the module they would like to put the directive inside
    echo "should ask the user what module to add to"
  fi
}