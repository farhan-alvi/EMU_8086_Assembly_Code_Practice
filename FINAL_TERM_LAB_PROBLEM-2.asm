                                         .MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 0DH,0AH,"ENTER 8 BIT BINARY NUMBER: $"
MSG2 DB 0DH,0AH,"TOTAL NUMBER OF 1: $"
MSG3 DB 0DH,0AH,"ODD$"
MSG4 DB 0DH,0AH,"EVEN$"

COUNT DB 0


.CODE
MAIN PROC

    ; Initialize data segment
    MOV AX,@DATA
    MOV DS,AX


    ; Ask user for binary input
    LEA DX,MSG1
    MOV AH,09H
    INT 21H

    ; We will take 8 binary digits
    MOV CX,8

    ; Set count of 1 bits to 0
    MOV COUNT,0


INPUT_LOOP:

    ; Take one binary digit
    MOV AH,01H
    INT 21H

    ; Check if the input is '1'
    CMP AL,'1'
    JE ONE_BIT

    ; If input is '0', just continue
    JMP NEXT_INPUT


ONE_BIT:

    ; Increase the number of 1 bits
    INC COUNT


NEXT_INPUT:

    ; Repeat until 8 bits are entered
    LOOP INPUT_LOOP


    ; Display total number of 1
    LEA DX,MSG2
    MOV AH,09H
    INT 21H

    ; Convert count to ASCII
    MOV DL,COUNT
    ADD DL,'0'

    ; Display count
    MOV AH,02H
    INT 21H


    ; Check whether COUNT is odd or even
    MOV AL,COUNT

    ; AND with 1
    AND AL,01H

    ; If result is 1, number is odd
    CMP AL,1
    JE ODD_NUMBER


    ; Otherwise number is even
    LEA DX,MSG4
    MOV AH,09H
    INT 21H

    JMP END_PROGRAM


ODD_NUMBER:

    ; Display ODD
    LEA DX,MSG3
    MOV AH,09H
    INT 21H


END_PROGRAM:

    ; Exit program
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN