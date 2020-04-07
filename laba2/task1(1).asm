.MODEL Small
.CODE
org 100h
begin: jmp start
Data1 DB 31h 
start: 
mov al,21h 
mov bl,26h  
mov cx,89h 
mov ah,34h 
mov bh,78h 
mov dx,0ABCH 

XCHG ax,bx  
XCHG cx,dx 
    
mov si,ax 
mov di,bx
mov bp,cx 
mov ax,04C00h
int 21h
end begin