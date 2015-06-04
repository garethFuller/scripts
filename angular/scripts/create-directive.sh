#!/bin/bash

function createDirective {

  checkRoot

  checkIFStandAlone "directive"

  # store the kebabcase value of the directive name
  kebabCase=$( kebabCase $1 )
  directiveName=$1

  if [ $standAlone == "y" ] ; then

    module="$kebabCase"

    # copy over the files and create the structure
    mkdir src/scripts/modules/"$module"
    cp -r "$scriptPath"/base/scripts/directive/ ./src/scripts/modules/"$module"

    # add the module to the app
    appendModule $kebabCase

  else

    log "Please select a module"

    # ask the user which module they would like to create the directive in
    module=$( selectModule )

    # copy just the directive and the template to the selected module
    cp "$scriptPath"/base/scripts/directive/template.html ./src/scripts/modules/"$module"
    cp "$scriptPath"/base/scripts/directive/directive.js ./src/scripts/modules/"$module"

    # add the require to the config for the module
    echo "require('./"$directiveName"Directive.js');" >> ./src/scripts/modules/"$module"/index.js

  fi

  #replace the constants
  replaceIn ./src/scripts/modules/"$module" "DIRECTIVENAME" "$directiveName"
  replaceIn ./src/scripts/modules/"$module" "TEMPLATENAME" "$kebabCase"

  # rename the template
  mv ./src/scripts/modules/"$module"/template.html ./src/scripts/modules/"$module"/"$kebabCase".html

  #rename the directive file
  mv ./src/scripts/modules/"$module"/directive.js ./src/scripts/modules/"$module"/"$directiveName"Directive.js


  log "directive $1 created"

}