#!/bin/bash

# Create the folder structure for the lib app
function createLib {

  # Make sure in correct place
  checkRoot

  # get kebab case lib name
  kebabCase=$( kebabCase $1 )

  # Make sure it does not alreday exist
  checkIfExists 'lib' $kebabCase

  # Create the folder structure
  mkdir app/lib/"$kebabCase"
  mkdir app/lib/"$kebabCase"/components
  mkdir app/lib/"$kebabCase"/services
  mkdir app/lib/"$kebabCase"/interfaces
  mkdir app/lib/"$kebabCase"/mocks
  mkdir app/lib/"$kebabCase"/pipes

  # Add get keeps
  touch app/lib/"$kebabCase"/components/.gitkeep
  touch app/lib/"$kebabCase"/services/.gitkeep
  touch app/lib/"$kebabCase"/interfaces/.gitkeep
  touch app/lib/"$kebabCase"/mocks/.gitkeep
  touch app/lib/"$kebabCase"/pipes/.gitkeep

  log "lib $1 created"
}
