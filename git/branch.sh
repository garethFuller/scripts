#!/bin/bash

function branch {
  while [[ -z "$name" ]]
  do
    echo "What is the name of the branch?"
    read name
  done

  # Now create everything
  git checkout develop
  git pull origin develop
  git checkout -b JCLARK-$name
}
