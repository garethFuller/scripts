#!/bin/bash

function checkIfExists {

  for f in ./app/"$1"/*; do
    # remove the path and get the item name
    component=${f#./*$1/}

    # first check for an exact match on item names
    if [ "$component" == "$2" ] ; then
      log "Item with that name already exists please use another name." "error"
      exit 1
    fi

  done
}
