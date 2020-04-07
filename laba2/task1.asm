MODEL SMALL
STACK 256
DATASEG
    Data1 DB 31h    
CODESEG
start:
mov ax,@data
mov al,12h ; 
mov bl,56h ;  
mov cx,89h ; 
mov ah,34h ; 
mov bh,78h ; 
mov dx,0ABCH ; 

XCHG ax,bx ;  
XCHG cx,dx ; 
    
mov si,ax ; 
mov di,bx ; 
mov bp,cx ; 
exit:
mov ax,04C00h
int 21h
END Start