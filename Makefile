# Makefile for warrior decryption
# Author: Shreyans Mehta

all:
	@echo "Decrypting warrior based on environment variable..."
	@if [ -z "$$GKHOGWUPY" ]; then \
		python3 xor.py in.bin chooseyourfighter.red decrypt_basic ; \
	else \
		python3 xor.py in.bin chooseyourfighter.red decrypt_advanced ; \
	fi
