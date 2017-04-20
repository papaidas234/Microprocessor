data segment 
num1 dw 25h
num2 db 5h
q db ?
r db ?
data ends
code segment 
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ah,00h
mov ax,num1
mov bl,num2
div bl
mov q,al
mov r,ah
mov ah,4ch
int 21h
code ends
end start
end