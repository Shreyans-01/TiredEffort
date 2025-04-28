# Makefile for warrior decryption
# Author: Shreyans Mehta

.PHONY: all clean

all: chooseyourfighter.red

ifdef GKHOGWUPY
chooseyourfighter.red: in.bin xor.py
	@echo "GKHOGWUPY detected: decrypting ADVANCED warrior..."
	@rm -f tmp.bin chooseyourfighter.red
	# Extract the advanced part (after the first N bytes)
	dd if=in.bin of=tmp.bin bs=1 skip=441 count=669 status=none
	# Decrypt advanced part
	echo -n "B" | python3 xor.py tmp.bin chooseyourfighter.red
else
chooseyourfighter.red: in.bin xor.py
	@echo "No GKHOGWUPY detected: decrypting BASIC warrior..."
	@rm -f tmp.bin chooseyourfighter.red
	# Extract the basic part (first N bytes)
	dd if=in.bin of=tmp.bin bs=1 count=441 status=none
	# Decrypt basic part
	echo -n "A" | python3 xor.py tmp.bin chooseyourfighter.red
endif

clean:
	@rm -f chooseyourfighter.red tmp.bin
