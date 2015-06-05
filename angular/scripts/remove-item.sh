#!/bin/bash

function removeItem {

  modules=()
  for f in ./src/scripts/modules/*; do
    # remove the path and get the module name
    module=${f#./*modules/}

    kebabCase=$( kebabCase $1 )

    # check for the module by name
    if [ "$module" == "$kebabCase" ] ; then
      # remove the whole module
      rm -r $f

      # remove the module ref in the app
      sed -i "" "/require('..\/$kebabCase').name/d" ./src/scripts/modules/app/index.js

      # remove the last , of the module list if it was the last one
      stripExtraComma

      log "Module $module removed."

      removed="yup"
    fi

    if [ "$2" ] ; then

      upperName=$( ucFirst "$2" )
      name="$1"

      # now check the files inside that folder to see if there is a file with
      # the same name as the item we want to remove
      if [ -e "$f/$name$upperName.js" ] ; then

        # remove the file
        rm "$f/$name$upperName.js"

        # remove the includes in the module
        sed -i "" "/require('.\/$name$upperName.js');/d" "$f/index.js"

        log "Item removed from within module $module"

        removed="yup"
      fi
    fi

    # check for HTML files, as directives create the templates
    if [ -e "$f/$kebabCase.html" ] ; then
      rm "$f/$kebabCase.html"
    fi

  done

  if [ "$removed" != "yup" ] ; then
    log "Could not find item $1"
  fi
}
