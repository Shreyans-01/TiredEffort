# Makefile for warrior decryption
# Author: Shreyans Mehta

binfile = in.bin
outfile = chooseyourfighter.red

all: $(outfile)

$(outfile): $(binfile) xor.py
	@rm -f tmp.bin $(outfile)
	@if [ -z "$$GKHOGWUPY" ]; then \
		echo "GKHOGWUPY not detected. Decrypting BASIC warrior..."; \
		dd if=$(binfile) of=tmp.bin bs=1 count=151 status=none; \
		echo -n "A" | python3 xor.py tmp.bin $(outfile); \
	else \
		echo "GKHOGWUPY detected. Decrypting ADVANCED warrior..."; \
		dd if=$(binfile) of=tmp.bin bs=1 skip=151 count=433 status=none; \
		echo -n "B" | python3 xor.py tmp.bin $(outfile); \
	fi

clean:
	rm -f tmp.bin $(outfile)
