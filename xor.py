# xor.py
import random
import sys

if len(sys.argv) != 4:
    print("Usage: python3 xor.py <input_file> <output_file> <mode>")
    print("mode: encrypt_basic, encrypt_advanced, decrypt_basic, decrypt_advanced")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]
mode = sys.argv[3]

key = [0] * 1094
random.seed(42)

def mutate_key(letter):
    for _ in range(ord(letter)):
        numj = random.randint(4, 250)
        for __ in range(numj):
            key[random.randint(0, 1093)] = random.randint(1, 250)

if mode in ['encrypt_basic', 'decrypt_basic']:
    mutate_key('A')
elif mode in ['encrypt_advanced', 'decrypt_advanced']:
    mutate_key('A')
    mutate_key('B')
else:
    print("Invalid mode, must be encrypt_basic, encrypt_advanced, decrypt_basic, or decrypt_advanced")
    sys.exit(1)

with open(input_file, "rb") as f:
    data = f.read()

half = len(data) // 2

# Decide what data to operate on
if mode in ['decrypt_basic']:
    data = data[:half]
elif mode in ['decrypt_advanced']:
    data = data[half:]
# (for encrypt_basic/advanced we use full data)

with open(output_file, "wb") as f:
    for i, byte in enumerate(data):
        f.write(bytes([(byte ^ key[i % 1094]) & 0x7F]))
