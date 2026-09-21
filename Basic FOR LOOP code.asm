.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    
    MOV CX,100
    
    LABEL:
    MOV AH,02H
    MOV DL,"*"
    INT 21H
    
    LOOP LABEL
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN

    
    