#!/bin/bash
#
function selectModule {

  modules=()
  for f in ./src/scripts/modules/*; do
    # remove the path and add the module name to the array
    module=${f#./*modules/}

    # here we check if the item found is a module and is not app
    # the user cannot use app as its the parent module for all
    if [ -e "$f/config.js" -a "$module" != "app" ] ; then
      modules+=("$module")
    fi

  done

  if [ $modules ] ; then
    # ask the user to select a module they would like
    select module in "${modules[@]}"
    do
      # return te module the user selected
      echo $module
      break
    done
  else
    # no modules
    echo ""
  fi
}