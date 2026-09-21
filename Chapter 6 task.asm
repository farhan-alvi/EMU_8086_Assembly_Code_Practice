.MODEL SMALL
.STACK 100H
.DATA
PROMPT DB 'Type a line of text' , 0DH, 0AH, '$'
NOCAP_MSG DB 0DH,0AH, 'No capitals $'
CAP_MSG DB 0DH,0AH,'First capital ='
FIRST DB '['
      DB ' Last capital = '
LAST DB '@ $' 

.CODE    

MAIN PROC 
    
;initialize DS 
MOV AX,@DATA
MOV DS,AX  

;display opening message
MOV AH,9                    ;display string function
LEA DX,PROMPT               ;get opening message
INT 21H                     ;display it

;read and process a line of text
MOV AH,1                    ;read char function
INT 21H

WHILE_:

;while character is not carrige return do
CMP AL,0DH                  ;CR?
JE  END_WHILE               ;yes,exit

;if character is a capital letter
CMP AL,'A'                  ;char >= "A"?
JNGE END_IF                 ;not a capital letter
CMP AL,'Z'                  ;char <= "Z" ?
JNL END_IF                 ;not a capital character

;then

;if character precedes first capital

CMP AL,FIRST
JNL CHECK_LAST  
;then first capital = character
MOV FIRST,AL

CHECK_LAST:
;if character follows last capital  

CMP AL,FIRST                ;char > last capital ?
JNG END_IF 

;then last capital
MOV LAST,AL
;end if

END_IF:
;read a character
INT 21H
JMP WHILE_
END_WHILE: 


;   display results 
                    
                    
MOV AH, 9       ;display string function 

;if no capitals were typed
   
CMP FIRST,']'       ; first = ']' 

JNE CAPS            ;no, display results  



;then

LEA DX,NOCAP_MSG ;no capitals 

JMP DISPLAY   


CAPS:

LEA DX,CAP_MSG           ;capitals   


DISPLAY:    

INT 21H    

;end_if 
;dos exit

MOV AH,4CH 
INT 21H 
MAIN  ENDP
END MAIN