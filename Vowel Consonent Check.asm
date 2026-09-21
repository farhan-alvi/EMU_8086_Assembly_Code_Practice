.MODEL SMALL
.STACK 100H
 
.DATA
    MSG1 DB 'Enter the alphabet (a-z): $'
    VOWEL DB 13,10,'The alphabet is a vowel.$'
    CONSO DB 13,10,'The alphabet is a consonant.$'
    UPPER DB 13,10,'Uppercase: $'
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
 
    ; Display input message
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H
 
    ; Read character
    MOV AH, 01H
    INT 21H
    MOV BL, AL
 
    ; Check vowel
    CMP AL, 'a'
    JE VOW
    CMP AL, 'e'
    JE VOW
    CMP AL, 'i'
    JE VOW
    CMP AL, 'o'
    JE VOW
    CMP AL, 'u'
    JE VOW
 
    ; Consonant
    LEA DX, CONSO
    MOV AH, 09H
    INT 21H
    JMP PRINTUP
 
VOW:
    LEA DX, VOWEL
    MOV AH, 09H
    INT 21H
 
PRINTUP:
    LEA DX, UPPER
    MOV AH, 09H
    INT 21H
 
    ; Convert lowercase to uppercase
    MOV AL, BL
    SUB AL, 20H
 
    ; Print uppercase letter
    MOV DL, AL
    MOV AH, 02H
    INT 21H
 
    ; Exit
    MOV AH, 4CH
    INT 21H
 
MAIN ENDP
END MAIN
 