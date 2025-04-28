# xor.py
import random
import sys

if len(sys.argv) != 4:
    print("Usage: python3 xor.py <input_file> <output_file> <mode>")
    print("mode: basic or advanced")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]
mode = sys.argv[3]  # 'basic' or 'advanced'

key = [0] * 1094
random.seed(42)

# Build the key
for char in ('A' if mode == 'basic' else 'AB'):
    for _ in range(ord(char)):
        numj = random.randint(4, 250)
        for __ in range(numj):
            key[random.randint(0, 1093)] = random.randint(1, 250)

# Open and read in.bin
with open(input_file, "rb") as f:
    data = f.read()

# Choose correct part
half = len(data) // 2
if mode == 'basic':
    data = data[:half]
elif mode == 'advanced':
    data = data[half:]
else:
    print("Invalid mode, must be 'basic' or 'advanced'")
    sys.exit(1)

# Decrypt and write output
with open(output_file, "wb") as f:
    for i, byte in enumerate(data):
        f.write(bytes([(byte ^ key[i % 1094]) & 0x7F]))
