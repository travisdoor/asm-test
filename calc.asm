;-------------------------------------------------------------------------------
; Experimental program to add two inputs from command line.
;-------------------------------------------------------------------------------

_CRT_INIT   proto
ExitProcess proto
printf      proto
scanf       proto

;- DATA ------------------------------------------------------------------------
.data

get_chars_msg db "Insert number: ", 0
result_str    db "%d + %d = %d", 0Ah, 0
scan_str      db "%d", 0

;- CODE ------------------------------------------------------------------------
.code

;- main ------------------------------------------------------------------------
main proc
	push    rbp
	mov     rbp, rsp

;- LOCALS ----------------------------------------------------------------------
; dword [rbp+04h] - First number.
; dword [rbp+08h] - Second number.

	sub     rsp, 10h ; alloca 16B
;-------------------------------------------------------------------------------

	sub     rsp, 20h ; add shadow space
	call    _CRT_INIT

	lea     rcx, [get_chars_msg]
	call    printf

	; read the first number
	lea     rcx, [scan_str]
	lea     rdx, [rbp+04h]
	call    scanf

	lea     rcx, [get_chars_msg]
	call    printf

	; read the second number
	lea     rcx, [scan_str]
	lea     rdx, [rbp+08h]
	call    scanf

	mov     eax, dword ptr [rbp+04h] ; load fisr number
	add     eax, dword ptr [rbp+08h]

	; print the result
	lea     rcx, [result_str]
	mov     edx, [rbp+04h]
	mov     r8d, [rbp+08h]
	mov     r9d, eax
	call    printf

	mov     rcx, 0
	call    ExitProcess
main endp

end