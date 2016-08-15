#!/bin/bash

function paths {
  customPath="/Users/garethfuller/Development/AppAndroid"
  replace="\/Users\/garethfuller\/Development\/AppAndroid"
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

function emulate {
  emulator @clark
}

function cdAnd {
  cd ~/Development/AppAndroid
}

function apk {
  # Build the app
  cdAnd
  ./AndroidApp/gradlew clean installDebug -PasX86 && adb shell am start -n de.clark/de.clark.activities.SplashActivity
  calabash-android resign /Users/garethfuller/Development/AppAndroid/AndroidApp/build/outputs/apk/AndroidApp-debug.apk
}

function clean {
  cdAnd
  ./AndroidApp/gradlew clean
}

function calabash {
  cdAnd
  calabash-android $1 AndroidApp/build/outputs/apk/AndroidApp-debug.apk
}

function calabashwip {
  cdAnd
  calabash-android run AndroidApp/build/outputs/apk/AndroidApp-debug.apk --tags @wip
}
