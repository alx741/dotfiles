#!/bin/sh

# Generate QR code from clipboard

QR_FILE=/tmp/qr.png

qrencode -s 10 -o "$QR_FILE" `xclip -selection clipbard -o` && \
    sxiv -b -q "$QR_FILE" && rm "$QR_FILE"
