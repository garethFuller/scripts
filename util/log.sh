#!/bin/bash

function log {
  echo "$(tput setaf 4)---------------------------"
  if [ $2 ] ; then
    if [ "$2" == "error" ] ; then
      echo "$(tput setaf 1) $1"
    fi
  else
    echo "$(tput setaf 2) $1"
  fi
  echo "$(tput setaf 4)---------------------------$(tput sgr0)"
}