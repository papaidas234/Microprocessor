data segment
n1 dw 2020h
n2 dw 1030h
res dw ?
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
