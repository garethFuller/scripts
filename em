#!/bin/bash
source $(dirname $0)/util/loader.sh
source $(dirname $0)/ember/loader.sh

operation=$1

if [ $operation == "templates" ] ; then
  templates
fi
