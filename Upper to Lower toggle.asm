.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC
    
    MOV AH,01H
    INT 21H
    
    
    XOR AL,20H
    
    MOV AH,02H  
    
    
           
          
           
    
    MOV DL,AL
    INT 21H
    
    
    
    
  
               
                
                
                
                
                
                
                
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN