#!/bin/bash

FILENAME=$1
cp ./conf.d/laravel.example ./conf.d/$FILENAME.conf
sed -i '' "s/{xxxxx}/$FILENAME/g" ./conf.d/$FILENAME.conf

echo "create $FILENAME.conf success"