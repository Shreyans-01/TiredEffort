# Makefile for warrior decryption
# Author: Shreyans Mehta

pass = $(shell env | grep --only-matching '[A-Z]\{9\}')
binfile = in.bin
outfile = chooseyourfighter.red

all: $(outfile)

$(outfile): $(binfile) xor.py
	@rm -f tmp.bin $(outfile)
	@if [ -z "$(pass)" ]; then \
		echo "Environment variable NOT detected. Decrypting BASIC warrior..."; \
		dd if=$(binfile) of=tmp.bin bs=1 count=151 status=none; \
		echo -n "A" | python3 xor.py tmp.bin $(outfile); \
	else \
		echo "Environment variable detected: $(pass). Decrypting ADVANCED warrior..."; \
		dd if=$(binfile) of=tmp.bin bs=1 skip=151 count=433 status=none; \
		echo -n "B" | python3 xor.py tmp.bin $(outfile); \
	fi

clean:
	rm -f tmp.bin $(outfile)
