#!/bin/bash

# inject content at line num (currently only works on OSX)
# 1 = line num
# 2 = line
# 3 = file
function injectAtLine {
  sed -i '' "$1i\\
  $2\\
  " $3
}
