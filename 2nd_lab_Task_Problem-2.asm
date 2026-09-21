.MODEL SMALL
.STACK 100H

.DATA

;============= DISPLAY MESSAGES =============

MSG1 DB '********************************',0DH,0AH,'$'
MSG2 DB 'FIFA WORLD CUP 2026',0DH,0AH,'$'
MSG3 DB '********************************',0DH,0AH,'$'
MSG4 DB 'TEAM A SCORE : $'
MSG5 DB 0DH,0AH,'TEAM B SCORE : $'
MSG6 DB 0DH,0AH,'TOTAL GOALS : $'
MSG7 DB 0DH,0AH,'GROUP : $'
MSG8 DB 0DH,0AH,'MVP CODE : $'
MSG9 DB 0DH,0AH,'MATCH FINISHED','$'

;============= STORED VALUES =============

NUM1 DB '2'      ; Will become 4
NUM2 DB '8'      ; Will become 6
CHAR1 DB 'A'     ; Will become D
CHAR2 DB 'X'     ; Will become Z

.CODE
MAIN PROC

    MOV AX,@DATA          ; Load data segment
    MOV DS,AX             ; Initialize DS

;============= DISPLAY FIRST LINE =============

    LEA DX,MSG1
    MOV AH,09H
    INT 21H

;============= DISPLAY TITLE =============

    LEA DX,MSG2
    MOV AH,09H
    INT 21H

;============= DISPLAY SECOND LINE =============

    LEA DX,MSG3
    MOV AH,09H
    INT 21H

;============= DISPLAY TEAM A SCORE =============

    LEA DX,MSG4
    MOV AH,09H
    INT 21H

    MOV DL,NUM1           ; Load '2'
    ADD DL,2              ; 2 -> 4
    MOV AH,02H
    INT 21H

;============= DISPLAY TEAM B SCORE =============

    LEA DX,MSG5
    MOV AH,09H
    INT 21H

    MOV DL,NUM2           ; Load '8'
    SUB DL,2              ; 8 -> 6
    MOV AH,02H
    INT 21H

;============= DISPLAY TOTAL GOALS =============

    LEA DX,MSG6
    MOV AH,09H
    INT 21H

    MOV DL,NUM2           ; Load '8'
    INC DL                ; 8 -> 9
    MOV AH,02H
    INT 21H

;============= DISPLAY GROUP =============

    LEA DX,MSG7
    MOV AH,09H
    INT 21H

    MOV DL,CHAR1          ; Load 'A'
    ADD DL,3              ; A -> D
    MOV AH,02H
    INT 21H

;============= DISPLAY MVP CODE =============

    LEA DX,MSG8
    MOV AH,09H
    INT 21H

    MOV DL,CHAR2          ; Load 'X'
    ADD DL,2              ; X -> Z
    MOV AH,02H
    INT 21H

;============= DISPLAY END MESSAGE =============

    LEA DX,MSG9
    MOV AH,09H
    INT 21H

;============= EXIT PROGRAM =============

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN