.MODEL SMALL
.STACK 100H

.CODE
MAIN PROC
    
    MOV CX,80
    
    TOP:
    MOV AH,02H
    MOV DL,'A'                  ;Display 'A' 80 times
    INT 21H
    
    LOOP TOP
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    