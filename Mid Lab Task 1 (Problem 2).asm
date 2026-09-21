.MODEL SMALL                    ; Small memory model
.STACK 100H                     ; Allocate stack space

.DATA                           ; Data segment
    
    
MSG1 DB 'Enter number 1: $'     ; Prompt for first number
MSG2 DB 0DH,0AH,'Enter number 2: $' ; Prompt for second number
MSG3 DB 0DH,0AH,'Enter number 3: $' ; Prompt for third number
MSG4 DB 0DH,0AH,'Calculation of $' ; Output message
MSG5 DB ' + $'                  ; Plus sign
MSG6 DB ' - $'                  ; Minus sign
MSG7 DB ' = $'                  ; Equal sign
    
    
N1  DB ?                        ; Store first number
N2  DB ?                        ; Store second number
N3  DB ?                        ; Store third number
RESULT DB ?                     ; Store result

.CODE

MAIN PROC

    MOV AX,@DATA                ; Load data segment address
    MOV DS,AX                   ; Initialize DS



    LEA DX,MSG1                 ; Load address of MSG1
    MOV AH,09H                 
    INT 21H                     ; Display message

    MOV AH,01H                 
    INT 21H                     ; Read character
    MOV N1,AL                   ; Store first number

  

    LEA DX,MSG2                 ; Load address of MSG2
    MOV AH,09H                  ; Print string
    INT 21H

    MOV AH,01H                  ; Read character
    INT 21H
    MOV N2,AL                   ; Store second number

 

    LEA DX,MSG3                 ; Load address of MSG3
    MOV AH,09H                  ; Print string
    INT 21H

    MOV AH,01H                  ; Read character
    INT 21H
    MOV N3,AL                   ; Store third number 
    
    

                                ;Calculating N1 + N2 - N3   
                    

    MOV AL,N1                   ; AL = N1
    SUB AL,'0'                  ; Convert to numeric value

    MOV BL,N2                   ; BL = N2 
    SUB BL,'0'                  ; Convert to numeric value
    
    ADD AL,BL                   ; AL = N1 + N2

    MOV BL,N3                   ; BL = N3 
    SUB BL,'0'                  ; Convert to numeric value
    SUB AL,BL                   ; AL = N1 + N2 - N3

    ADD AL,'0'                 
    MOV RESULT,AL                 

            

    LEA DX,MSG4                 ; Display "Calculation of "
    MOV AH,09H
    INT 21H

    MOV DL,N1                   ; Print first number
    MOV AH,02H
    INT 21H

    LEA DX,MSG5                 ; Print " + "
    MOV AH,09H
    INT 21H

    MOV DL,N2                   ; Print second number
    MOV AH,02H
    INT 21H

    LEA DX,MSG6                 ; Print " - "
    MOV AH,09H
    INT 21H

    MOV DL,N3                   ; Print third number
    MOV AH,02H
    INT 21H

    LEA DX,MSG7                 ; Print " = "
    MOV AH,09H
    INT 21H

    MOV DL,RESULT                  ; Print result
    MOV AH,02H
    INT 21H

  

    MOV AH,4CH                
    INT 21H

MAIN ENDP

END MAIN