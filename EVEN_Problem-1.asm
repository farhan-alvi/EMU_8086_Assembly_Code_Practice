.MODEL SMALL
.STACK 100H

.DATA

MSG1 DB 0DH,0AH,"TYPE A CHARACTER: $"                           ;Displaying all messages
MSG2 DB 0DH,0AH,"THE ASCII CODE IN BINARY IN REVERSE IS: $"
MSG3 DB 0DH,0AH,"THE NUMBER OF 0 BITS IS: $"
MSG4 DB 0DH,0AH,"Do you want to do it again? $"
MSG5 DB 0DH,0AH,"Thank you. Program ends here.$"

COUNT DB 0


.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
  
START:  
    
 LEA DX,MSG1
 MOV AH,09H
 INT 21H
 
 MOV AH,01H
 INT 21H
          
 MOV BL,AL         
          
 LEA DX,MSG2 
 MOV AH,09H
 INT 21H
 
 MOV CX,8
 
 MOV COUNT,0
            
            
 PRINT_BINARY:
 
 SHR BL,1        ;REVERSE
 
 JC BIT_ONE
 
 MOV DL,'0'
 MOV AH,02H
 INT 21H
 
 INC COUNT
 
 
 JMP NEXT_BIT
 
 
 
 
 
 
 
 
 BIT_ONE:
 
 MOV DL,'1'
 MOV AH,02H
 INT 21H
 
 
 
 
 NEXT_BIT:
 
 LOOP PRINT_BINARY 
 
  LEA DX,MSG3
    MOV AH,09H
    INT 21H

   MOV DL,COUNT
   ADD DL,'0'
   
  MOV AH,02H
  INT 21H 

 LEA DX,MSG4
    MOV AH,09H
    INT 21H  
    
    
    MOV AH,01H
    INT 21H
    
    
    
      ; Check for uppercase Y
    CMP AL,'Y'
    JE START

    ; Check for lowercase y
    CMP AL,'y'
    JE START


    ; If anything else, end the program
    LEA DX,MSG5
    MOV AH,09H
    INT 21H


    ; Exit program
    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN
    