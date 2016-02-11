#!/bin/bash

function remove-commit {
  while [[ -z "$commit" ]]
  do
    echo "What is the commit id?"
    read commit
  done

  git rebase --onto $commit^ $commit HEAD

}
