DATA SEGMENT
N1 DB 02H
N2 DB 04H
RES DW ?
DATA ENDS

CODE SEGMENT
START:
ASSUME CS:CODE,DS:DATA
MOV AX,DATA
MOV DS,AX

MOV BL,N1
MOV AL,N2
ADD AL,BL
MOV RES,AX

MOV AH,4CH
INT 21H

CODE ENDS
END START
END