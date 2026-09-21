.MODEL SMALL
.STACK 100H
.CODE 

MAIN PROC     
    
    
    
    
   XOR BX,BX
   MOV AH,01H
   INT 21H
   
   LABEL:
   
   CMP AL,0DH
   JE QUIT 
    
   AND AL,0FH    ;CONVERT INTO BINARY
   SHL BX,1
   OR BL,AL 
   INT 21H
   JMP LABEL 











    QUIT:
    
















                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
                 
    MOV AH,4CH
    INT 21H 
    
    MAIN ENDP
END MAIN