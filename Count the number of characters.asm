.MODEL SMALL
.STACK 100H

 

.CODE
MAIN PROC  

    
    MOV DX,0
    
    MOV AH,01H
    INT 21H
    
    WHILE:
    
    CMP AL,0DH           ;CHECK FOR CARRIGE RETURN
    JE TERMINATE
    INC DX
    
    INT 21H
    
    JMP WHILE
    
    TERMINATE:
    
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    