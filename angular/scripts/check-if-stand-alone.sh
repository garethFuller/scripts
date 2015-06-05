#!/bin/bash

# Check if the user would like to make a stand alone item, like factory / service etc

function checkIFStandAlone {
  # user needs to select how they intend to create the module
  while [ "$standAlone" != "y" -a "$standAlone" != "n" ]
  do
    echo -n "Create $1 as module? [y or n]: "
    read standAlone
  done

}