#!/bin/bash

npm run build:spa && cp -r ./dist/apps/spa/* /usr/share/nginx/html/

PORT=3000 npm run start:api &

if [ -z "$1" ]; then
  echo "No command provided. Starting nginx..."
else
  echo "Running command: $1"
  exec "$@"
fi
nginx -g 'daemon off;'