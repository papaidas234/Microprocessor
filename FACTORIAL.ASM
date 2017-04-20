DATA SEGMENT
     N1 DW 05H
     N2 DW ?
DATA ENDS
CODE SEGMENT
     ASSUME CS:CODE,DS:DATA
       START:
             MOV AX,DATA
             MOV DS,AX
             CALL FACT
             MOV N2,AX
             INT 21H
         FACT PROC
             MOV AX,01H
             MOV CX,N1
          BACK: MUL CX
               DEC CX
               JNZ BACK
               RET
         ENDP
      CODE ENDS
      END START

