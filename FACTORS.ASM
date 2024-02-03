;READ A NUMBER AND PRINT ITS FACTORS.

.MODEL SMALL

PRINTS MACRO P
    LEA DX,P
    MOV AH,09H
    INT 21H
ENDM

.DATA
NUMBER DB 0
DIVISOR DB 1
STRING1 DB "ENTER A NUMBER:$"
STRING2 DB 10,13,"FACTORS ARE:$"
SEPARATOR DB ", $"

.CODE
MOV AX,@DATA
MOV DS,AX

PRINTS STRING1

READ:
MOV AH,01H       ; DOS function to read a character
INT 21H
SUB AL,30H       ; Convert ASCII to integer
MOV NUMBER,AL    ; Store the entered number

MOV CH,0
MOV CL,NUMBER

PRINTS STRING2

FIND_FACTORS:
MOV AH,0         ; Clear AH before division
MOV AL,NUMBER    ; Load the dividend
MOV BL,DIVISOR   ; Load the divisor
DIV BL           ; Divide AL by BL; quotient in AL, remainder in AH
CMP AH,0         ; Check if the remainder is zero
JNE NOT_FACTOR   ; Jump if not a factor

MOV AH,02H       ; DOS function to print a character
MOV DL,DIVISOR   ; Move the divisor to DL
ADD DL,'0'       ; Convert to ASCII
INT 21H          ; Print the factor

PRINTS SEPARATOR ; Print the separator

NOT_FACTOR:
INC DIVISOR      ; Increment the divisor
LOOP FIND_FACTORS ; Repeat until the divisor exceeds the number

EXIT:
MOV AH,4CH       ; DOS function to exit the program
INT 21H
END
