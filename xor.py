# decrypt.py

import random
import sys

input_file = sys.argv[1]
output_file = sys.argv[2]
which = sys.argv[3]  # 'basic' or 'advanced'

# Set up the same key
key = [0] * 1094
random.seed(42)

# Simulate key transformation
if which == 'basic':
    for i in range(ord('A')):
        numj = random.randint(4, 250)
        for j in range(numj):
            key[random.randint(0, 1093)] = random.randint(1, 250)
elif which == 'advanced':
    for i in range(ord('A')):
        numj = random.randint(4, 250)
        for j in range(numj):
            key[random.randint(0, 1093)] = random.randint(1, 250)
    for i in range(ord('B')):
        numj = random.randint(4, 250)
        for j in range(numj):
            key[random.randint(0, 1093)] = random.randint(1, 250)
else:
    print("Invalid mode (should be 'basic' or 'advanced')")
    sys.exit(1)

# Now decrypt
with open(input_file, "rb") as f_in, open(output_file, "wb") as f_out:
    data = f_in.read()
    if which == 'basic':
        # basic.red is stored first in in.bin
        data = data[:len(data)//2]
    else:
        # advanced.red is second half
        data = data[len(data)//2:]

    for i, b in enumerate(data):
        f_out.write(bytes([(b ^ key[i % 1094]) & 0x7F]))
