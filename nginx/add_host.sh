#!/bin/bash

FILENAME=$1
CONTAINER_NAME=${2:-php-fpm}
cp ./conf.d/laravel.example ./conf.d/$FILENAME.conf
sed -i '' "s/{xxxxx}/$FILENAME/g" ./conf.d/$FILENAME.conf
sed -i '' "s/{CONTAINER_NAME}/$CONTAINER_NAME/g" ./conf.d/$FILENAME.conf

echo "create $FILENAME.conf success"