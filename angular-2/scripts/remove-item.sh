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
      log "$1 removed."
      removed="yup"
    fi

  done

  if [ "$removed" != "yup" ] ; then
    log "Could not find item $1 $2" "error"
  fi
}
