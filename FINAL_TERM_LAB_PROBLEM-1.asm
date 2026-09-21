.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 0DH,0AH,"TYPE A CHARACTER: $"
MSG2 DB 0DH,0AH,"THE ASCII CODE IN BINARY IS: $"
MSG3 DB 0DH,0AH,"THE NUMBER OF 1 BITS IS: $"
MSG4 DB 0DH,0AH,"Do you want to do it again? $"
MSG5 DB 0DH,0AH,"Thank you. Program ends here.$"

COUNT DB 0


.CODE
MAIN PROC

    ; Initialize data segment
    MOV AX,@DATA
    MOV DS,AX


START:

    ; Ask the user to enter a character
    LEA DX,MSG1
    MOV AH,09H
    INT 21H

    ; Take one character as input
    MOV AH,01H
    INT 21H

    ; Save the character in BL since I will manupulate the bits using SHL
    MOV BL,AL

    ; Print message for binary
    LEA DX,MSG2
    MOV AH,09H
    INT 21H

    ; We will check all 8 bits
    MOV CX,8

    ; Clear the 1-bit counter
    MOV COUNT,0


PRINT_BINARY:

    ; Shift the leftmost bit into Carry Flag
    SHL BL,1

    ; Check whether the bit was 1 or 0
    JC BIT_ONE                              ;it will jump when the bit is 1

    ; If Carry = 0, print 0
    MOV DL,'0'
    MOV AH,02H
    INT 21H

    JMP NEXT_BIT


BIT_ONE:

    ; If Carry = 1, print 1
    MOV DL,'1'
    MOV AH,02H
    INT 21H

    ; Increase number of 1 bits
    INC COUNT


NEXT_BIT:

    ; Repeat until all 8 bits are checked
    LOOP PRINT_BINARY


    ; Print number of 1 bits message
    LEA DX,MSG3
    MOV AH,09H
    INT 21H

    ; Convert COUNT into ASCII character
    MOV DL,COUNT
    ADD DL,'0'        ;Number to ASCII

    ; Display the count
    MOV AH,02H
    INT 21H


    ; Ask user whether to repeat
    LEA DX,MSG4
    MOV AH,09H
    INT 21H

    ; Take Y/y or any other character
    MOV AH,01H
    INT 21H

    ; Check for uppercase Y
    CMP AL,'Y'
    JE START

    ; Check for lowercase y
    CMP AL,'y'
    JE START


    ; If anything else, end the program
    LEA DX,MSG5
    MOV AH,09H
    INT 21H


    ; Exit program
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN