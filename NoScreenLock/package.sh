#!/bin/bash

# Clean trước khi build — tránh shitcode dính lại từ lần trước
make clean all TARGET=iphone-arm64 FINALPACKAGE=1 SDKVERSION=17.0

# Di chuyển deb vào folder releases để upload dễ hơn
mkdir -p ./releases
mv ./packages/*.deb ./releases/ || true

echo "✅ .deb đã được tạo tại ./releases/"
