#!/usr/bin/env bash

VERSION=1.0.0

rm -fr build/web

flutter build web --web-renderer canvaskit --release --dart-define=API_SERVER_URL=http://ai.tiaotiaofish.com:8020
cd scripts && go run main.go ../build/web/main.dart.js && cd ..
rm -fr build/web/fonts/ && mkdir build/web/fonts
cp -r scripts/s build/web/fonts/s

docker buildx build --platform=linux/amd64,linux/arm64 -t dajiangai/guduai-web:$VERSION . --push

