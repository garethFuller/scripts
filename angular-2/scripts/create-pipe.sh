#!/bin/bash

function createPipe {
  createItem "$1" "pipes"
  log "pipe $1 created"
}
