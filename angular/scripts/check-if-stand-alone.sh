#!/bin/bash

# Check if the user would like to make a stand alone item, like factory / service etc

function checkIFStandAlone {
  # user needs to select how they intend to create the module
  while [ "$standAlone" != "y" -a "$standAlone" != "n" ]
  do
    echo -n "Would you like to create the $1 as a stand alone module? [y or n]: "
    read standAlone
  done

}