#!/bin/bash

function log {
  echo "$(tput setaf 4)---------------------------"
  echo "$(tput setaf 2) $1"
  echo "$(tput setaf 4)---------------------------$(tput sgr0)"
}