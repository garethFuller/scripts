#!/bin/bash

function createDirective {

  # optional extra files
  singleFiles=('template.html')
  replaceWith=('kebabCase')

  # create the directive
  createItem "$1" "directive" "$singleFiles" "$replaceWith"

}
