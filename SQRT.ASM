DATA SEGMENT
        NO DD 40
        RES DD ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
        START:
                MOV AX,DATA
                MOV DS,AX
                FINIT
                FLD NO
                FSQRT
                FSTP RES
                MOV AH, 4CH
                INT 21H
        CODE ENDS
        END START

