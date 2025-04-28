# Makefile for warrior decryption
# Author: Shreyans Mehta

.PHONY: all clean

all: chooseyourfighter.red

ifdef GKHOGWUPY
chooseyourfighter.red: in.bin xor.py
	@echo "Environment variable GKHOGWUPY detected, decrypting ADVANCED warrior..."
	@rm -f tmp.bin chooseyourfighter.red
	dd if=in.bin of=tmp.bin bs=1 skip=151 count=433 status=none
	echo -n "B" | python3 xor.py tmp.bin chooseyourfighter.red
else
chooseyourfighter.red: in.bin xor.py
	@echo "Environment variable GKHOGWUPY NOT detected, decrypting BASIC warrior..."
	@rm -f tmp.bin chooseyourfighter.red
	dd if=in.bin of=tmp.bin bs=1 count=151 status=none
	echo -n "A" | python3 xor.py tmp.bin chooseyourfighter.red
endif

clean:
	rm -f tmp.bin chooseyourfighter.red
