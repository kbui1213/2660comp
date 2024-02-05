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
    variableB   SWORD  -3210           ; 16-bit signed integer
    variableC   SDWORD  ?               ; 32-bit signed integer
    variableD   SBYTE   ?               ; 8-bit signed integer


promptC 	BYTE "What is value of C?", 0
promptD		BYTE"What is value of D?", 0
myString	BYTE"Z = (A - B) - (C - D)", 0
space		BYTE"   :   ", 0
.code
main PROC
	
	; code goes here
	; code for variable C and prompt
	mov edx, OFFSET promptC
    call WriteString
    call ReadInt
    mov variableC, eax


	; code for variableD and prompt
    mov edx, OFFSET promptD
    call WriteString
    call ReadInt
    movsx eax, al   ; Move only the low byte of eax into eax
    mov variableD, al
	call Crlf

	;new line after prompt, now display Z= (A-B) - (C -D)
	call Crlf
	mov edx, OFFSET myString
	call WriteString
	call Crlf
	
	mov eax, variableA
    call WriteInt
	mov edx, OFFSET space
	call WriteString
    movsx eax, variableB
    call WriteInt
	mov edx, OFFSET space
	call WriteString
    mov eax, variableC
	call WriteInt
	mov edx, OFFSET space
	call WriteString
    movsx eax, variableD
    call WriteInt



	call DumpRegs ; displays registers in console

	exit

main ENDP
END main
