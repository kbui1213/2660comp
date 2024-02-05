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
	variableA   SDWORD  ?               ; 32-bit signed integer
    variableB   SDWORD  -3210           ; 16-bit signed integer
    variableC   SDWORD  ?               ; 32-bit signed integer
    variableD   SBYTE   ?               ; 8-bit signed integer

promptA 	BYTE "What is value of A?", 0

.code
main PROC
	
	; code goes here
	mov edx, OFFSET promptA
    call WriteString
    call ReadInt
    mov variableA, eax
	call DumpRegs ; displays registers in console

	exit

main ENDP
END main
