	; Program name: "Random Number Normalization". This program fills an array with up to
	; an element with a random number and normalizes them into the number within the range of
	; 1.0 and 2.0
	; Development Environment: [Linux Ubuntu 22.04]
	; NASM Version: [NASM 2.14.02]
	; Compilation Command: nasm -f elf64 -o show_array.o show_array.asm
	; Processor Architecture: [x86_64]
	; Floating - Point Standard: IEEE 754
	;
	; Copyright (C) <2024> Erik Williams
	;
	; This file is part of the software program "Random Number Normalization".
	;
	; Random Number Normalization is free software: you can redistribute it and / or modify
	; it under the terms of the GNU General Public License as published by
	; the Free Software Foundation, either version 3 of the License, or
	; (at your option) any later version.
	;
	; Author information:
	; Author name: Erik Williams
	; Author section: 240 - 9
	
	
	global show_array
	extern printf
	
	segment .data
	output_header db "IEEE754               Scientific Decimal", 10, 0
	output_format db "0x%016lx    %-18.13g", 10, 0
	
	segment .bss
	align 64
	storedata resb 832
	
	segment .text
show_array:
	; Back up components
	push rbp
	mov rbp, rsp
	push rbx
	push rcx
	push rdx
	push rsi
	push rdi
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	pushf
	
	; Save all the floating - point numbers
	mov rax, 7
	mov rdx, 0
	xsave [storedata]
	
	xor r13, r13                 ; r13 keeps track of the index of the loop
	mov r14, rdi                 ; rdi contains the array
	mov r15, rsi                 ; rsi contains the count of the array
	
	; Print the header
	mov rax, 0
	mov rdi, output_header
	call printf
	
output_loop:
	; If the index reach the count, end the loop
	cmp r13, r15
	jge output_finished
	
	; Print the current element
	mov rax, 1
	mov rdi, output_format
	mov rsi, [r14 + r13 * 8]
	movsd xmm0, [r14 + r13 * 8]
	call printf
	
	; Inrease the index and repeat the loop
	inc r13
	jmp output_loop
	
output_finished:
	; Restore all the floating - point numbers
	mov rax, 7
	mov rdx, 0
	xrstor [storedata]
	
	; Restore the original values to the GPRs
	popf
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	pop rbp
	
	; Clean up
	ret
