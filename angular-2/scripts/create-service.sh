#!/bin/bash

function createService {
  createItem "$1" "services"
  log "service $1 created"
}
