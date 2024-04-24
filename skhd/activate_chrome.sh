#!/bin/bash

ID=$(yabai -m query --windows | jq -r 'map(select(.app == "Google Chrome" and ."is-native-fullscreen" == true and ."has-focus" == false)) | .[0].id // empty')

if [ -z "$ID" ]; then
  ID=$(yabai -m query --windows | jq -r 'map(select(.app == "Google Chrome" and ."is-native-fullscreen" == false)) | .[0].id // empty')
fi

yabai -m window --focus $ID
