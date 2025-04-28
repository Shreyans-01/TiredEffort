# Makefile for warrior decryption
# Author: Shreyans Mehta

.PHONY: all clean

all: chooseyourfighter.red

chooseyourfighter.red: in.bin xor.py
	@rm -f tmp.bin chooseyourfighter.red
	@if [ -z "$$GKHOGWUPY" ]; then \
		echo "Environment variable GKHOGWUPY not detected - decrypting BASIC warrior..."; \
		dd if=in.bin of=tmp.bin bs=1 count=151 status=none; \
		echo -n "A" | python3 xor.py tmp.bin chooseyourfighter.red; \
	else \
		echo "Environment variable GKHOGWUPY detected - decrypting ADVANCED warrior..."; \
		dd if=in.bin of=tmp.bin bs=1 skip=151 count=433 status=none; \
		echo -n "B" | python3 xor.py tmp.bin chooseyourfighter.red; \
	fi

clean:
	rm -f tmp.bin chooseyourfighter.red
