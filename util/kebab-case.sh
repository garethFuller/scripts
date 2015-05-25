#!/bin/bash

function kebabCase {
  echo "$1" | sed 's/\(.\)\([A-Z]\)/\1-\2/g' | tr '[:upper:]' '[:lower:]'
}
