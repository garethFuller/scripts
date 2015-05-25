#!/bin/bash

function firstChunkHyphen {
  echo $1 | sed "s/[-].*$//"
}
