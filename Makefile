# Makefile

all:
	@echo "Choosing correct warrior based on environment variable..."
	@if [ -z "$$GKHOGWUPY" ]; then \
		head -c $$(( $$(stat -c%s in.bin) / 2 )) in.bin > temp_basic.bin; \
		echo -n "A" | python3 xor.py temp_basic.bin chooseyourfighter.red; \
		rm temp_basic.bin; \
	else \
		tail -c $$(( $$(stat -c%s in.bin) / 2 )) in.bin > temp_advanced.bin; \
		echo -n "B" | python3 xor.py temp_advanced.bin chooseyourfighter.red; \
		rm temp_advanced.bin; \
	fi
