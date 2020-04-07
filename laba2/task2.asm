.MODEL SMALL
.STACK 100h
.DATA
Data1 DB 31h
SRC DB 1,2,3,4,5,6,7,8
DST DB 8 DUP (?)
ABC DB 3 DUP (?)
.CODE
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

int 21h
mov ax,4c00h
int 21h
end start 