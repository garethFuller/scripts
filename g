#!/bin/bash
source $(dirname $0)/git/loader.sh

operation=$1

if [ $operation == "branch" ] ; then
  branch $2
elif [ $operation == 'remove-commit' ] ; then
  remove-commit $2
fi
