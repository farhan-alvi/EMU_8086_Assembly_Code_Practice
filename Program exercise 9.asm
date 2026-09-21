.MODEL SMALL
.STACK 100H
 
.DATA
 
CR EQU 0DH
LF EQU 0AH
MSG1 DB '?$'
MSG2 DB CR,LF,'THE SUM OF $'
MSG3 DB ' AND $'
MSG4 DB ' IS $'
 
FIRST DB ?
SECOND DB ?
 
.CODE
MAIN PROC
 
    ; Initialize Data Segment
    MOV AX,@DATA         ; get data segment
    MOV DS,AX            ; initialize DS
 
    ; Display '?'
    LEA DX,MSG1          ; get first message
    MOV AH,9             ; display string function
    INT 21H              ; display '?'
 
    ; Read first digit
    MOV AH,1              ; read character function
    INT 21H               ; read first digit
    MOV FIRST,AL          ; store first digit
 
    ; Read second digit
    MOV AH,1              ; read character function
    INT 21H               ; read second digit
    MOV SECOND,AL         ; store second digit
 
    ; New line and message
    LEA DX,MSG2           ; get second message
    MOV AH,9              ; display string function
    INT 21H               ; display "THE SUM OF"
 
    ; Display first digit
    MOV DL,FIRST          ; move first digit to DL
    MOV AH,2              ; display character function
    INT 21H               ; display first digit
 
    ; Display " AND "
    LEA DX,MSG3          ; get third message
    MOV AH,9              ; display string function
    INT 21H                ; display " AND "
 
    ; Display second digit
    MOV DL,SECOND         ; move second digit to DL
    MOV AH,2               ; display character function
    INT 21H                ; display second digit
 
    ; Display " IS "
    LEA DX,MSG4         ; get fourth message
    MOV AH,9             ; display string function
    INT 21H               ; display " IS "
 
    ; Calculate sum
    MOV AL,FIRST        ; get first digit
    SUB AL,'0'          ; convert ASCII to decimal
    MOV BL,SECOND       ; get second digit
    SUB BL,'0'          ; convert ASCII to decimal
    ADD AL,BL           ; add two digits
    ADD AL,'0'          ; convert result to ASCII
 
    ; Display sum
    MOV DL,AL          ; move sum to DL
    MOV AH,2           ; display character function
    INT 21H             ; display sum
 
    ; Exit
    MOV AH,4CH       ; return control to DOS
    INT 21H
 
MAIN ENDP
END MAIN
