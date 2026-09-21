.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 'ENTER YOUR 1ST NUMBER = $'
MSG2 DB 0DH,0AH,'ENTER YOUR 2ND NUMBER = $'
MSG3 DB 0DH,0AH,'YOUR RESULT IS = $'

N1 DB ?
N2 DB ?
RESULT DB ?

                ;This code works for N2-N1
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1        ;show the 1st message
    MOV AH,09H
    INT 21H
    
    MOV AH,01H         ;take the input
    INT 21H
    MOV N1,AL 
    
    LEA DX,MSG2        ;show the 2nd message
    MOV AH,09H
    INT 21H
    
    MOV AH,01H         ;take the input
    INT 21H
    MOV N2,AL
    
   ;====CALCULATION======
   
   MOV AL,N1
   SUB AL,'0'           ;converting ASCII into number
   
   MOV BL,N2
   SUB BL,'0'
   
   SUB BL,AL
   
   ADD BL,'0'
   
   MOV RESULT,BL
   
   
   ;====DISPLAY====
   
   
    LEA DX,MSG3
    MOV AH,09H
    INT 21H
    
                      
    MOV DL,RESULT
    MOV AH,02H
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    


    MAIN ENDP
END MAIN
   
   