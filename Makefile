# Makefile for warrior decryption
# Author: Shreyans Mehta

pass = $(shell env | grep --only-matching 'GKHOGWUPY')
makefile = $(abspath $(lastword $(MAKEFILE_LIST)))
outfile = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))chooseyourfighter.red
binfile = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))in.bin

default:
	@if [ -z "$(pass)" ]; then \
		echo "No environment variable detected. Decrypting BASIC warrior..."; \
		dd if=$(binfile) of=tmp.bin bs=1 count=340 status=none; \
		echo -n "A" | python3 xor.py tmp.bin $(outfile); \
	else \
		echo "Environment variable GKHOGWUPY detected. Decrypting ADVANCED warrior..."; \
		dd if=$(binfile) of=tmp.bin bs=1 skip=340 count=345 status=none; \
		echo -n "B" | python3 xor.py tmp.bin $(outfile); \
	fi

clean:
	rm -f tmp.bin $(outfile)

