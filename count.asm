;-------------------------------------------------------------------------------
; Experimental program reading the input and printing out in loop.
;-------------------------------------------------------------------------------

_CRT_INIT   proto
ExitProcess proto
printf      proto
scanf       proto

;- DATA ------------------------------------------------------------------------
.data

get_chars_msg db "Insert number: ", 0
msg           db "i = %d", 0Ah, 0
scan_str      db "%d", 0

;- CODE ------------------------------------------------------------------------
.code

;- main ------------------------------------------------------------------------
main proc
	push    rbp
	mov     rbp, rsp

;- LOCALS ----------------------------------------------------------------------
; int n = 0
	sub     rsp, 10h
	mov     dword ptr [rbp+04h], 0
;-------------------------------------------------------------------------------

	sub     rsp, 20h ; add shadow space
	call    _CRT_INIT

	lea     rcx, [get_chars_msg]
	call    printf

	lea     rcx, [scan_str]
	lea     rdx, [rbp+04h]
	call    scanf

	mov     ecx, dword ptr [rbp+04h]
	call    print_hello

	mov     rcx, 0
	call    ExitProcess
	add     rsp, 20h
	ret
main endp

;- print_hello -----------------------------------------------------------------
; ecx - count of hello messages
;-------------------------------------------------------------------------------
print_hello proc
	push    rbp
	mov     rbp, rsp

;- LOCALS ----------------------------------------------------------------------
; int c = 0
	sub     rsp, 10h
	mov     dword ptr [rbp+04h], 0
;-------------------------------------------------------------------------------

	sub     rsp, 20h

	mov     dword ptr [rbp+10h], ecx

_next:
	mov     eax, dword ptr [rbp+10h]
	cmp     dword ptr [rbp+04h], eax
	je      _done

	lea     rcx, [msg]
	mov     edx, dword ptr [rbp+04h]
	call    printf

	inc     dword ptr [rbp+04h]
	jmp     _next

_done:
	xor     eax, eax
	add     rsp, 10h ; cleanup local variables
	add     rsp, 20h ; cleanup shadow space
	pop     rbp
	ret
print_hello endp
;-------------------------------------------------------------------------------

end