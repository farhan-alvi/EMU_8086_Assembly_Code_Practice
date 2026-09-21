                                                                                 .MODEL SMALL
.STACK 100H

.DATA

;============= DISPLAY MESSAGES =============

MSG1 DB '==========================',0DH,0AH,'$'
MSG2 DB 'FIFA WORLD CUP 2026',0DH,0AH,'$'
MSG3 DB '==========================',0DH,0AH,'$'
MSG4 DB 'HOST CITY : MEXICO CITY',0DH,0AH,'$'
MSG5 DB 'GROUP : $'
MSG6 DB 0DH,0AH,'MATCH NO. : $'
MSG7 DB 0DH,0AH,'NEXT MATCH : $'
MSG8 DB 0DH,0AH,'STATUS CODE : $'
MSG9 DB 0DH,0AH,'END OF REPORT',0DH,0AH,'$'

;============= STORED VALUES =============

CHAR1 DB 'A'      ; It will become B
CHAR2 DB '5'      ; It will become 8
CHAR3 DB '7'      ; It will become 5
CHAR4 DB 'X'      ; It will become Y   

ALVI DB ?      

MSG10 DB  0DH,0AH, "HERE IS MY OUTPUT = $"

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

;============= DISPLAY HOST CITY =============

    LEA DX,MSG4
    MOV AH,09H
    INT 21H

;============= DISPLAY GROUP =============

    LEA DX,MSG5
    MOV AH,09H                
    INT 21H

    MOV DL,CHAR1          ; Load 'A'
    INC DL                ; A -> B
    MOV AH,02H
    INT 21H

;============= DISPLAY MATCH NUMBER =============

    LEA DX,MSG6
    MOV AH,09H
    INT 21H

    MOV DL,CHAR2          ; Load '5'
    ADD DL,3              ; 5 -> 8
    MOV AH,02H
    INT 21H

;============= DISPLAY NEXT MATCH =============

    LEA DX,MSG7
    MOV AH,09H
    INT 21H

    MOV DL,CHAR3          ; Load '7'
    SUB DL,2              ; 7 -> 5
    MOV AH,02H
    INT 21H

;============= DISPLAY STATUS CODE =============

    LEA DX,MSG8
    MOV AH,09H
    INT 21H

    MOV DL,CHAR4          ; Load 'X'
    INC DL                ; X -> Y
    MOV AH,02H
    INT 21H

;============= DISPLAY END MESSAGE =============

    LEA DX,MSG9
    MOV AH,09H
    INT 21H
               
               
               
               
    MOV AH ,01H
    INT 21H
    MOV ALVI,AL
               
    MOV AH,02H
               
    LEA DX,MSG10
    MOV AH,09H
    INT 21H
           
    MOV AH,02H       
    MOV DL,ALVI
    INT 21H         


    MOV AH,4CH    ;DOS exit
    INT 21H

MAIN ENDP
END MAIN