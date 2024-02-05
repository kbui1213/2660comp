TITLE

; Name: 
; Date: 
; ID: 
; Description: 

INCLUDE Irvine32.inc
INCLUDELIB Irvine32.lib

; these two lines are only necessary if you're not using Visual Studio
INCLUDELIB kernel32.lib
INCLUDELIB user32.lib

.data
    
	; data declarations go here
	variableA   SDWORD  -543210               ; 32-bit signed integer
    variableB   SDWORD  -3210           ; 16-bit signed integer
    variableC   SDWORD  ?               ; 32-bit signed integer
    variableD   SBYTE   ?               ; 8-bit signed integer
	variableZ	SDWORD ? : 32 bit signed integer variable

promptC 	BYTE "What is value of C?", 0
promptD		BYTE"What is value of D?", 0
.code
main PROC
	
	; code goes here
	; code for variable C and prompt
	mov edx, OFFSET promptC
    call WriteString
    call ReadInt
    mov variableC, eax

	mov edx, OFFSET variableC
	call WriteString
	mov eax, variableC
	call WriteInt

	; code for variableD
    mov edx, OFFSET promptD
    call WriteString
    call ReadInt
    movsx eax, al   ; Move only the low byte of eax into eax
    mov variableD, al

    mov edx, OFFSET promptD
    movsx eax, variableD   ; Sign extend 8-bit D to 32 bits
    call WriteInt
	call DumpRegs ; displays registers in console

	exit

main ENDP
END main
