.MODEL SMALL              
.STACK 100H               

.DATA

.CODE       


MAIN PROC

    MOV AH,1              ;this is keyboard input function  
    INT 21H               ;read first initial
    MOV BL,AL             ;store 1st initial input (A)

    MOV AH,1              ;this is keyboard input function
    INT 21H               ;read second initial
    MOV BH,AL             ;store 2nd initial input (B) 
    
    MOV AH,1              ;this is keyboard input function
    INT 21H               ;read third initial
    MOV CL,AL             ;store 3rd initial input (C)

    MOV AH,1              ;this is keyboard input function
    INT 21H               ;read fourth initial
    MOV CH,AL             ;store 4th initial input (D) 
    

    MOV AH,2              ;character output function  
      
    
    
    MOV DL,0DH            ;carriage return
    INT 21H
    MOV DL,0AH            ;line feed
    INT 21H 
    
    

    MOV DL,BL             ;display A
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H

    MOV DL,BL             ;display A
    INT 21H

    MOV DL,0DH            ;carriage return
    INT 21H
    MOV DL,0AH            ;line feed
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H

    MOV DL,BH             ;display B
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H
    INT 21H

    MOV DL,BH             ;display B
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H

    MOV DL,0DH            ;carrige return
    INT 21H
    MOV DL,0AH            ;line feed
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H

    MOV DL,CL             ;display C
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H

    MOV DL,CL             ;display C
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H

    MOV DL,0DH            ;new line
    INT 21H
    MOV DL,0AH
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H
    INT 21H

    MOV DL,CH             ;display D
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H
    INT 21H
                   
                   
    MOV DL,0DH            ;carrige return
    INT 21H
    MOV DL,0AH            ;line feed
    INT 21H                      
    

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H

    MOV DL,CL             ;display C
    INT 21H                            
    
    

    MOV DL,'#'            ;display #
    INT 21H
  
  
    MOV DL,CL             ;display C
    INT 21H
  
  
    MOV DL,'#'            ;display #
    INT 21H
    INT 21H
  
  
    MOV DL,0DH            ;new line
    INT 21H
    MOV DL,0AH
    INT 21H
  
  
    MOV DL,'#'            ;display #
    INT 21H

    MOV DL,BH             ;Display B
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H
    INT 21H

    MOV DL,BH             ;display B
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H

    MOV DL,0DH            ;new line
    INT 21H
    MOV DL,0AH
    INT 21H

    MOV DL,BL             ;display A
    INT 21H

    MOV DL,'#'            ;display #
    INT 21H
    INT 21H
    INT 21H
    INT 21H
    INT 21H

    MOV DL,BL             ;display A
    INT 21H
      
      
      
    MOV AH,4CH           
    INT 21H
             
             
             
MAIN ENDP
END MAIN   
    
    

   