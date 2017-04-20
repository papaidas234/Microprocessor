.MODEL   small
.STACK   1000
.DATA
.CODE
		
MAIN    PROC
        mov     ax,@data     ;Initialize DS to address
        mov     ds,ax        ; of data segment
	.586
	xor 	eax,eax	     ; clear eax
	cpuid 		     ; question the CPU about itself
	mov 	al,0 	     ; clear al
	mov 	ah,'$' 	     ; add terminator char
	push 	ax 
	push 	ecx
	push 	edx
	push 	ebx
	mov 	dx,sp 	     ; print the stack
	mov 	ah,9h 	     ; print string function
        int     21h          ;display message
Exit:   mov     ah,4Ch       ;DOS function: Exit program
        mov     al,0         ;Return exit code value
        int     21h          ;Call DOS. Terminate program
	MAIN    ENDP         ;End of program
        END     MAIN         ; entry point