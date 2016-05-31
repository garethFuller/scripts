#!/bin/bash

function templates {

  echo "Which engine?"

  engines=()
  for f in ./client/lib/*; do
    engines+=("$f")
  done

  if [ $engines ] ; then
    # ask the user to select a module they would like
    select engine in "${engines[@]}"
    do
      # Copy over the files
      rm -r "$engine"/app/templates/*
      cp -r "$engine"/addon/templates/* "$engine"/app/templates/
      
      echo "Done"
      break
    done
  fi

}
