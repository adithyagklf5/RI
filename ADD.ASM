;READ TWO NUMBER OUTPUT SUM

.MODEL SMALL

PRINTN MACRO P
    LEA DX,P
    MOV AH,09H
    INT 21H
ENDM

.DATA
MSG1 DB 10,13,'FIRST NUMBER:$'
MSG2 DB 10,13,'SECOND NUMBER:$'
MSG3 DB 10,13,'RESULT:$'

.CODE
MOV AX,@DATA
MOV DS,AX

PRINTN MSG1          ; Print "FIRST NUMBER:$"
MOV AH,01H           ; DOS function to read a character
INT 21H              ; Read the first character
SUB AL,30H           ; Convert ASCII to integer
MOV BL,AL            ; Move the first digit to BL

PRINTN MSG2          ; Print "SECOND NUMBER:$"
MOV AH,01H           ; DOS function to read a character
INT 21H              ; Read the second character
SUB AL,30H           ; Convert ASCII to integer
ADD AL,BL            ; Add the first digit to the second digit

PRINTN MSG3          ; Print "RESULT:$"
MOV CL,0AH           ; Set CL to 10 for division
MOV AH,00H           ; Clear AH before division
DIV CL               ; Divide AL by CL; quotient in AL, remainder in AH
MOV BH,AH            ; Move the tens digit to BH
ADD AL,30H          ; Convert the units digit to ASCII
MOV DL,AL            ; Move the units digit to DL
MOV AH,02H           ; DOS function to print a character
INT 21H              ; Print the units digit
ADD BH,30H          ; Convert the tens digit to ASCII
MOV DL,BH            ; Move the tens digit to DL
INT 21H              ; Print the tens digit

MOV AH,4CH           ; DOS function to exit the program
INT 21H
END
