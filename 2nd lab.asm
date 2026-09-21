.MODEL SMALL
.STACK 100H

.DATA

;=========== STRINGS ===========

LINE1 DB '==========================',0DH,0AH,'$'
TITLE DB 'FIFA WORLD CUP 2026',0DH,0AH,'$'
LINE2 DB '==========================',0DH,0AH,'$'

HOST DB 'HOST CITY : MEXICO CITY',0DH,0AH,'$'

GROUP DB 'GROUP : $'
MATCH DB 0DH,0AH,'MATCH NO. : $'
NEXT DB 0DH,0AH,'NEXT MATCH : $'
STATUS DB 0DH,0AH,'STATUS CODE : $'
ENDMSG DB 0DH,0AH,'END OF REPORT','$'

;=========== STORED VALUES ===========

LETTER DB 'A'      ; Will become B
NUM1   DB '5'      ; Will become 8
NUM2   DB '7'      ; Will become 5
CODE   DB 'X'      ; Will become Y

.CODE

MAIN PROC

    MOV AX,@DATA          ; Load data segment
    MOV DS,AX             ; Initialize DS

;=========== DISPLAY FIRST LINE ===========

    LEA DX,LINE1
    MOV AH,09H
    INT 21H

;=========== DISPLAY TITLE ===========

    LEA DX,TITLE
    MOV AH,09H
    INT 21H

;=========== DISPLAY SECOND LINE ===========

    LEA DX,LINE2
    MOV AH,09H
    INT 21H

;=========== DISPLAY HOST CITY ===========

    LEA DX,HOST
    MOV AH,09H
    INT 21H

;=========== DISPLAY GROUP ===========

    LEA DX,GROUP
    MOV AH,09H
    INT 21H

    MOV DL,LETTER         ; DL = 'A'
    INC DL                ; A -> B
    MOV AH,02H
    INT 21H

;=========== DISPLAY MATCH NUMBER ===========

    LEA DX,MATCH
    MOV AH,09H
    INT 21H

    MOV DL,NUM1           ; DL = '5'
    ADD DL,3              ; 5 -> 8
    MOV AH,02H
    INT 21H

;=========== DISPLAY NEXT MATCH ===========

    LEA DX,NEXT
    MOV AH,09H
    INT 21H

    MOV DL,NUM2           ; DL = '7'
    SUB DL,2              ; 7 -> 5
    MOV AH,02H
    INT 21H

;=========== DISPLAY STATUS CODE ===========

    LEA DX,STATUS
    MOV AH,09H
    INT 21H

    MOV DL,CODE           ; DL = 'X'
    INC DL                ; X -> Y
    MOV AH,02H
    INT 21H

;=========== DISPLAY END MESSAGE ===========

    LEA DX,ENDMSG
    MOV AH,09H
    INT 21H

;=========== EXIT PROGRAM ===========

    MOV AH,4CH            ; Return control to DOS
    INT 21H

MAIN ENDP
END MAIN