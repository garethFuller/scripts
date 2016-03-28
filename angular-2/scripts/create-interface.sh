#!/bin/bash

function createInterface {
  createItem "$1" "interfaces"
  log "interface $1 created"
}
