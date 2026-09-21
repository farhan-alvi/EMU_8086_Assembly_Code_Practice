.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    MOV AH,01H
    INT 21H
    MOV BL,AL           ;FIRST CHARACTER = BL SMALL
    
    MOV AH,01H
    INT 21H
    MOV BH,AL
    
    CMP BL,'a'
    JL EXIT
    
    CMP BL, 'z'
    JG EXIT
    
    CMP BH,'A'
    JL EXIT
    
    CMP BH,'Z'
    JG EXIT
    
    
    MOV CX,10
    
    TOP:
    
    MOV AH,02H
    
    MOV DL,BL
    INT 21H
    
    MOV DL,BH
    INT 21H
    
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LOOP TOP
    
    
    ;CONVERTION
    
    MOV AL,BL
    
    AND AL,0DFH
    
    MOV DL,AL
    MOV AH,02H
    INT 21H 
    
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV AL,BH
    
    OR AL,20H
    
    MOV DL,AL
    MOV AH,02H
    INT 21H          
              
              
              
              
              
              
              
              
              
    EXIT:          
              
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN


