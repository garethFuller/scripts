#!/bin/bash

function checkIfExists {

  modules=()
  for f in ./src/scripts/modules/*; do
    # remove the path and get the module name
    module=${f#./*modules/}

    # first check for an exact match on item names
    if [ "$module" == "$1" ] ; then
      log "Module with that name already exists please use another name." "error"
      exit 1
    fi

    if [ "$2" -a "$3" ] ; then
      # now check the files inside that folder to see if there is a file with
      # the same name as the item we want to create
      if [ -e "$f/$2$3.js" ] ; then
        log "Item with that name already exists within a the module $module" "error"
        exit 1
      fi
    fi

  done
}