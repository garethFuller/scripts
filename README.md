# scripts

Handy scripts, add the path to the repo on PATH var and you can use

## currently implemented

### Angular generator

Use 'ang help' for list of options
- generate anguar project with gulp tasks already
- generate angular module using camelCase 'ang module sampleName'
- generate angular service using camelCase 'ang service sampleName'
- generate angular factory using camelCase 'ang factory sampleName'
- generate angular value using camelCase 'ang value sampleName'
- generate angular constant using camelCase 'ang constant sampleName'

for all of the above you can make the items as a stand alone module (required by parent app) or as a item inside an existing module my choosing the module to insert it into (follow on screen instructions)


## whats comming up

- sanity checking on modules to make sure duplicates cannot be created
- sanity check to make sure if integrated item the chosen item is actually a module as you cannot integrate a service into a factory for example and currently we just list all folders in the modules directory
- help docs!
- generate angular filter

Other generators like angular ionic, ionic components etc

[![Stories in Ready](https://badge.waffle.io/garethfuller/scripts.png?label=ready&title=Ready)](http://waffle.io/garethfuller/scripts)
