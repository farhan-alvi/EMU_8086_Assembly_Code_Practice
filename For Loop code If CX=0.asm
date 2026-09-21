.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    
    MOV CX,0
    JCXZ SKIP
    
    TOP:
    MOV AH,02H
    MOV DL,'*'
    INT 21H
    
    LOOP TOP
    JMP SKIP
            
    SKIP:        
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN