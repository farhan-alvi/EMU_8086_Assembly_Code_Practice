.MODEL SMALL
.STACK 100H  
 
.DATA
CHAR DB ?

.CODE

MAIN PROC
          
    MOV AX,@DATA
    MOV DS,AX      
          
    MOV AH,01H
    INT 21H  
    
    MOV CHAR,AL
    

    
    MOV CX,50
    
    TOP:
    MOV AH,02H
    MOV DL,CHAR
    INT 21H   
    
     MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    LOOP TOP
    
    MOV AH,4CH
    INT 21H
    
     MAIN ENDP
END MAIN
    