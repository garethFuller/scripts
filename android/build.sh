#!/bin/bash

function build {
  while [[ -z "$apkName" ]]
  do
    echo "new apk name?"
    read apkName
  done

  #build everything
  cordova build --release android

  # sign the apks
  jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore platforms/android/build/outputs/apk/android-x86-release-unsigned.apk alias_name
  jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore my-release-key.keystore platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk alias_name

  # zip align the apks
  zipalign -v 4 platforms/android/build/outputs/apk/android-x86-release-unsigned.apk $apkName-x86.apk
  zipalign -v 4 platforms/android/build/outputs/apk/android-armv7-release-unsigned.apk $apkName-armv7.apk

}
