#!/bin/bash

function removeItem {

  # Make the type plural
  type="$1"s

  for f in ./app/"$type"/*; do
    # remove the path and get the item name
    name=${f#./*"$type"/}
    kebabCase=$( kebabCase $2 )

    # check for the item by name
    if [ "$name" == "$kebabCase" ] ; then
      # remove the whole folder
      rm -r $f

      # if the item is a component we need to remove it from the app.ts routes
      if [ $type == 'components' ]; then
        ucFirst=$( ucFirst $2 )
        ucFirstComponentName=$ucFirst"Component"
        sed -i "" "/import {$ucFirstComponentName}\ from\ '\.\.\/$kebabCase\/index'\;/d" "app/components/app/app.ts"
        sed -i "" "/{path\:'\/$kebabCase'\,\ name\:\ '$ucFirst'\,\ component\:\ $ucFirstComponentName}\,/d" "app/components/app/app.ts"
      fi

      log "$1 removed."
      removed="yup"

    fi

  done


  if [ "$removed" != "yup" ] ; then
    log "Could not find item $1 $2" "error"
  fi
}
