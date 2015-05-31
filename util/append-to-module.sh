#!/bin/bash

function appendModule {

  # add the module to the app
  # -0777 read whole file
  # -i replce inline (had to be seperate on osx)
  # regex to find last module match 4 and append the new one
  # perl seems to be better than sed for things like this
  perl -0777 -i -pe "s/(\'app((.|\n)*)\,)(\n.*)/\1\4\,\n\ \ require('..\/$1').name/g" ./src/scripts/modules/app/index.js

}
