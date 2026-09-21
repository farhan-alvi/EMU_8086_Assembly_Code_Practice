.MODEL SMALL   
.STACK 100H
.DATA

MSG1 DB "    It is a vowel $",0DH,0AH
MSG2 DB "    It is not a vowel $" 

.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AH,01H
    INT 21H
    
    
    
    CMP AL,41H
    JE VOWEL
    
    CMP AL,45H
    JE VOWEL
    
    CMP AL,49H
    JE VOWEL
    
    CMP AL,4FH
    JE VOWEL
    
    CMP AL,55H
    JE VOWEL
    
    JMP NOT_VOWEL
    
    VOWEL:
    LEA DX,MSG1
    MOV AH,09H
    INT 21H 
    
    JMP END_CASE 
    
    NOT_VOWEL:
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    
    JMP END_CASE
    
    
    
    END_CASE:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    