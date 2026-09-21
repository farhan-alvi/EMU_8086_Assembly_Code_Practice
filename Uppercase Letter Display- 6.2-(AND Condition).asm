.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    
    MOV AH,01H
    INT 21H
    
    CMP AL,41H
    JL END_CASE
    
    CMP AL,5AH
    JG END_CASE
           
    MOV AH,02H       
    MOV DL,AL
    INT 21H  
    
    END_CASE:
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN