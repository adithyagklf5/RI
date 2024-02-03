;FIND LARGEST IN ARRAY.(ARRAY GIVEN INSIDE PGM)

.MODEL SMALL
.DATA 
    ARRAY DB 1,2,6,3,7,9
    STRING DB 10,13,'LARGEST IS:$'

.CODE
    MOV AX,@DATA
    MOV DS,AX
    LEA SI, ARRAY      ; Load effective address of the array into SI
    MOV BL, [SI]       ; Load the first value of the array into BL
    MOV CX, 5          ; Set the loop counter (number of elements in the array)

LOOP_BACK:
    INC SI             ; Move to the next element in the array
    CMP BL, [SI]       ; Compare the current element with the current maximum
    JG BIG             ; Jump to BIG if the current element is greater
    MOV BL, [SI]       ; Update the current maximum if the current element is greater
BIG:
    LOOP LOOP_BACK     ; Repeat the loop until CX becomes zero

EXIT:
    LEA DX, STRING     ; Load the address of the output string into DX
    MOV AH, 09H        ; DOS function to print a string
    INT 21H            ; Call DOS to print the string

    MOV DL, BL         ; Move the largest value into DL
    ADD DL, 30H        ; Convert the numeric value to ASCII
    MOV AH, 02H        ; DOS function to print a character
    INT 21H            ; Call DOS to print the character

    MOV AH, 4CH        ; DOS function to terminate the program
    INT 21H            ; Call DOS to terminate

END
