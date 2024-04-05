#!/bin/bash

# Author information
# Author name : Erik Williams
# Author section: 240-9

echo "Compiling the main file..."
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c -std=c17

echo "Compiling the executive file..."
nasm -f elf64 -o executive.o executive.asm

echo "Compiling the show_array file..."
nasm -f elf64 -o show_array.o show_array.asm

echo "Compiling the normalize_array file..."
nasm -f elf64 -o normalize_array.o normalize_array.asm

echo "Compiling the fill_random_array file..."
nasm -f elf64 -o fill_random_array.o fill_random_array.asm

nasm -f elf64 -o sort_array.o sort_array.asm

echo "Compiling the isnan file..."
nasm -f elf64 -o isnan.o isnan.asm

echo "Linking the object files..."
gcc -m64 -no-pie -o hw5.out -std=c17 show_array.o main.o executive.o fill_random_array.o normalize_array.o sort_array.o isnan.o

echo "Running hw5.."
./hw5.out

