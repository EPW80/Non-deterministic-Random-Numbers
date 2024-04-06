# Random Number Normalization Project

## Overview

The Random Number Normalization project is a software tool designed to generate an array of random numbers and normalize them within the range of 1.0 to 2.0. This project is primarily written in Assembly, showcasing low-level programming capabilities and floating-point arithmetic operations. It includes a custom implementation to check for Not-a-Number (NaN) values, ensuring robust handling of floating-point operations.

## Features

- Random Number Generation: Utilizes the rdrand instruction for hardware-generated randomness, ensuring high-quality random numbers.

- Normalization: Converts the generated random numbers into a specified range, demonstrating floating-point arithmetic in Assembly.

- Sorting: Implements a bubble sort algorithm to organize the normalized numbers, providing insights into algorithm implementation in Assembly.

## Components

- executive.asm: The main driver code that orchestrates input collection, random number generation, normalization, sorting, and output.

- fill_random_array.asm: Handles the generation of random numbers using the rdrand instruction.

- normalize_array.asm: Normalizes the generated random numbers to fit within the desired range.

- show_array.asm: Outputs the contents of the array, both before and after normalization and sorting.

- sort_array.asm: Implements a bubble sort algorithm to sort the normalized numbers.

- r.sh: A Bash script to compile, link, and execute the project, streamlining the build process.

## Prerequisites

- NASM (Netwide Assembler) for assembling the Assembly code.

- GCC (GNU Compiler Collection) for compiling and linking the C and Assembly components.

- A Linux-based operating system or an environment that supports Bash scripts and the above tools.

## Demo

![](./rand.gif)

### Contact

- Author: Erik Williams
