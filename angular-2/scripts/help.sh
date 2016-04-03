#!/bin/bash

function helpDocs {
  # show the help docs
  echo "$(tput setaf 4)---------------------------"
  echo "$(tput setaf 7) NG help"
  echo "$(tput setaf 2) ng new sampleName:$(tput setaf 7) Create project with name sampleName"
  echo "$(tput setaf 2) ng component sampleName optionalLibName:$(tput setaf 7) Create component with name sampleName, can also pass a lib name (to create the component in that lib)"
  echo "$(tput setaf 2) ng mock sampleName:$(tput setaf 7) Create mock with name sampleName"
  echo "$(tput setaf 2) ng pipe sampleName:$(tput setaf 7) Create pipe with name sampleName"
  echo "$(tput setaf 2) ng service sampleName:$(tput setaf 7) Create service with name sampleName"
  echo "$(tput setaf 2) ng interface sampleName:$(tput setaf 7) Create interface with name sampleName"
  echo "$(tput setaf 2) ng rm service sampleName:$(tput setaf 7) remove service with name sampleName"
  echo "(the above can also be used with: service, mock, interface and component)"
  echo "$(tput setaf 2) ng lib sampleName:$(tput setaf 7) Create library (sub application) with name sampleName"
  echo "$(tput setaf 4)---------------------------$(tput sgr0)"

}
