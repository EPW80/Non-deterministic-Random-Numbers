	global isnan
	
	segment .text
	
isnan:
	; A double - precision floating - point number is passed in xmm0
	; The result will be set in eax: 0 if not NaN, 1 if NaN
	
	; Use ucomisd to compare the value with itself
	ucomisd xmm0, xmm0
	
	; If PF flag is set, it's NaN. ucomisd sets PF flag if either operand is NaN
	setp al                      ; Set AL to 1 if PF flag is set (NaN), otherwise AL is 0
	
	; Clear the rest of EAX to ensure only AL is relevant
	movzx eax, al
	
	ret
