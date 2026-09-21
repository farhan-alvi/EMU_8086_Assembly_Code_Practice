.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB "ENTER THE 1ST VALUE = $"
MSG2 DB 0DH,0AH, "ENTER THE 2ND VALUE = $"   
MSG3 DB 0DH,0AH, "RESULT IS = $"

N1 DB ?
N2 DB ?

RESULT DB ?

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1         ;SHOWING THE FIRST MESSAGE
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H             ;TAKING 1ST INPUT
    MOV N1,AL
    
    LEA DX,MSG2         ;SHOWING THE SECOND MESSAGE
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H             ;TAKING 2ND INPUT 
    MOV N2,AL   
    
    ====CALCULATION====
    
    MOV AL,N1
    SUB AL,'0'          ;CONVERTING ASCII INTO NUMBER
    
    MOV BL,N2
    SUB BL,'0'          ;CONVERTING ASCII INTO NUMBER
    
    ADD AL,BL           ;ADDING 2 VALUES
    
    ADD AL,'0'          ;CONVERTING NUMBER BACK TO ASCII
    
    MOV RESULT,AL
    
    ======DISPLAY=====
    
    LEA DX,MSG3         ;SHOWJNG MESSAGE 3
    MOV AH,09H  
    INT 21H
    
    MOV AH,02H
    MOV DL,RESULT
    INT 21H
    
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
             
                    
    
