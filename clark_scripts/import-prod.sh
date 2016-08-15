#!/bin/bash

function importProd {
  pg_restore -c -U garethfuller -d optisure_development optisure_prod_current.dmp
}
