#!/bin/bash

function createMock {
  createItem "$1" "mocks"
  log "mock $1 created"
}
