.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 'ENTER NUMBER 1 : $'

MSG2 DB 0DH,0AH,'ENTER NUMBER 2 : $'

MSG3 DB 0DH,0AH,'RESULT IS : $'

N1 DB ?

N2 DB ?

RESULT DB ?


.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX    
    
    LEA DX,MSG1     ;showing the 1st message
    MOV AH,09H
    INT 21H
    
    MOV AH,01H      ; taking 1st input
    INT 21H
    MOV N1,AL          
    
    LEA DX,MSG2     ;showing the 2nd message
    MOV AH,09H
    INT 21H
    
    MOV AH,01H       ;taking 2nd input
    INT 21H
    MOV N2,AL     
    
    
    ;=======CALCULATION======
    
    
    MOV AL,N1
    SUB AL,'0'     ;converting ASCII into number
    
    MOV BL,N2
    SUB AL,'0'     ;converting ASCII into number
                   
    ADD AL,BL
    
    ADD AL,'0'     ;convert back to ASCII
    
    MOV RESULT,AL
    
    
    ;=========DISPLAY=======
    
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
