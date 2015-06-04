#!/bin/bash

function selectModule {

  modules=()
  for f in ./src/scripts/modules/*; do
    # remove the path and add the module name to the array
    module=${f#./*modules/}
    modules+=("$module")
  done

  # ask the user to select a module they would like
  select module in "${modules[@]}"
  do
    # return te module the user selected
    echo $module
    break
  done
}