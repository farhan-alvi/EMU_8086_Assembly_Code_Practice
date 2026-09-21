.MODEL SMALL
.STACK 100H 

.DATA      

NUM1 DB 10  ; creating a variable  

NUM2 DB 20


.CODE
MAIN PROC       

     MOV AX,@DATA
     MOV DS,AX
     
     MOV AL,NUM1
     MOV BL,NUM2
     
     ADD AL,BL   
     
     ADD AL,48          ;convert to ASCII
     
     MOV DL,AL
     MOV AH,2
     INT 21H              
              
              
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    