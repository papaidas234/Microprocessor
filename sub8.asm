data segment
n1 db 220h
n2 db 130h
res db ?
data ends
code segment
assume cs:code,ds:data
start:
mov ax,data
mov ds,ax
mov ax,n1
mov bx,n2
sub ax,bx
mov res,ax
mov ah,4ch
int 21h
code ends
end start
end
