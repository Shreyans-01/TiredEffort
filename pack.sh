#!/bin/bash
# pack.sh - Encrypt warriors and build in.bin
# Author: Shreyans Mehta

# Exit immediately if any command fails
set -e

echo "Cleaning old files..."
rm -f basic.enc advanced.enc in.bin

echo "Encrypting basic.red to basic.enc..."
echo -n "A" | python3 xor.py basic.red basic.enc

echo "Encrypting advanced.red to advanced.enc..."
echo -n "B" | python3 xor.py advanced.red advanced.enc

echo "Combining basic.enc and advanced.enc into in.bin..."
cat basic.enc advanced.enc > in.bin
