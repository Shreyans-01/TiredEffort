# Makefile for warrior submission - decrypts basic or advanced warrior
# depending on environment variable GKHOGWUPY.

.PHONY: all clean

all: chooseyourfighter.red

ifdef GKHOGWUPY
chooseyourfighter.red: in.bin xor.py
	@echo "Environment variable GKHOGWUPY is set - decrypting advanced warrior..."
	@rm -f chooseyourfighter.red             # ensure fresh output file
	echo -n "B" | python3 xor.py in.bin $@    # use key for advanced warrior
else
chooseyourfighter.red: in.bin xor.py
	@echo "Environment variable GKHOGWUPY not set - decrypting basic warrior..."
	@rm -f chooseyourfighter.red             # ensure fresh output file
	echo -n "A" | python3 xor.py in.bin $@    # use key for basic warrior
endif

clean:
	@rm -f chooseyourfighter.red
