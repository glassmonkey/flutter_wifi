#!/bin/bash

cd "$(PWD)"

mkdir -p android/app/src/main/java/nagano/shunsuke/plugins/

flutter pub run pigeon --input lib/pigeon/scheme.dart
