#!/bin/bash

function stripExtraComma {

  perl -0777 -i -pe "s/(\'app((.|\n)*))(\,\n\])/\1\n\]/g" ./src/scripts/modules/app/index.js
}
