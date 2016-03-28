#!/bin/bash

function toUpper {
  echo $1 | awk '{ print toupper($0) }'
}
