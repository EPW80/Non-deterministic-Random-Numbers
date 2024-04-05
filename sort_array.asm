	; Program name: "Random Number Normalization". This program fill an array with up to
	; element with a random number and normalize them into a number within the range of
	; 1.0 and 2.0
	; Copyright (C) <2023> <Erik Williams>
	
	; This file is part of the software program "Random Number Normalization".
	
	; Random Number Normalization is free software: you can redistribute it and / or modify
	; it under the terms of the GNU General Public License as published by
	; the Free Software Foundation, either version 3 of the License, or
	; (at your option) any later version.
	
	; Random Number Normalization is distributed in the hope that it will be useful, 
	; but WITHOUT ANY WARRANTY; without even the implied warranty of
	; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	; GNU General Public License for more details.
	
	; You should have received a copy of the GNU General Public License
	; along with this program. If not, see <https: / / www.gnu.org / licenses / >.
	
	; Author information
	; Author name : Erik Williams
	; Author section: 240 - 9
	
	global sort_array
	extern rdrand
	
	segment .data
	
	segment .bss
	align 64
	storedata resb 832
	segment .text
	
sort_array:
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
	mov r14, rdi                 ; rdi contains the address of the random_number_array
	mov r15, rsi                 ; rsi contains the count of the random_number_array
	
sort_loop:
	; Assume r14 is the address of the array, and r15 is the count of elements
	; Check if the count is less than 2 (no need to sort)
	cmp r15, 2
	jl sort_finished             ; Jump to sort_finished if count is less than 2
	
	; Set up for bubble sort
	mov r13, 0                   ; Outer loop counter (i)
	
outer_loop:
	xor r12, r12                 ; Inner loop counter (j), reset for each outer loop iteration
	xor r11, r11                 ; Flag to check if any swap has been made
	
inner_loop:
	cmp r12, r15
	jge decrement_count          ; Jump to decrement_count if end of array is reached
	
	; Load the current and next element of the array
	mov rax, [r14 + r12 * 8]     ; Load arr[j]
	mov rbx, [r14 + r12 * 8 + 8] ; Load arr[j + 1]
	
	; Compare arr[j] and arr[j + 1]
	cmp rax, rbx
	jle no_swap                  ; If arr[j] <= arr[j + 1], do not swap
	
	; Swap arr[j] and arr[j + 1]
	mov [r14 + r12 * 8], rbx
	mov [r14 + r12 * 8 + 8], rax
	mov r11, 1                   ; Set flag indicating a swap
	
no_swap:
	inc r12
	jmp inner_loop               ; Repeat inner loop
	
decrement_count:
	; If no swaps were made in the last pass, the array is sorted
	cmp r11, 0
	je sort_finished
	
	dec r15                      ; Decrease the count, optimizing the bubble sort
	jmp outer_loop               ; Repeat outer loop
	
sort_finished:
	; Restore all the floating - point numbers
	mov rax, 7
	mov rdx, 0
	xrstor [storedata]
	
	;Restore the original values to the GPRs
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
