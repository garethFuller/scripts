#!/bin/bash

function clark {
  customPath="/Users/garethfuller/Development/AppAndroid/AppAndroid"
  replace="\/Users\/garethfuller\/Development\/AppAndroid\/AppAndroid"
  url="http:\/\/192\.168\.16\.15:3000"
  devUrl="https:\/\/clark:clarkkent@dev\.clark\.de"
  devUrlTwo="https:\/\/dev\.clark\.de"

  # Swap the paths out in settings gradle file
  replaceIn "$customPath/AndroidApp/settings.gradle" "\/home\/ubuntu\/AppAndroid\/" "$replace\/"

  # Swap the dev URLs for the local ones
  replaceIn "$customPath/AndroidApp/src/main/java/de/clark/activities/LoginActivity.java" $devUrl $url
  replaceIn "$customPath/AndroidApp/src/main/java/de/clark/activities/LoginActivity.java" $devUrlTwo $url

  echo 'Done'
}
