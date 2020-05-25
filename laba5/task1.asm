.MODEL small
.STACK 256
.data
mess0   db  13,10,'Array(A): $'
mess1   db  13,10,'Vector(M): $'
mess2   db  13,10,'Arithmetical mean: $' 
am db ?
vectA db 9 dup (?)
vectM db ? 
len     =   $ - vectA   
divT    db  2  
.code
MODPROG: 
    xor si,si
    xor bx,bx
    mov cx,len 
m1:
    mov al,vectA [si]
    test al,1
    jnz  m2    
    mov vectM[bx],al
    inc bx
m2:
    inc si
    loop m1           
RET 
    
main:
 mov ax,@data
 mov ds,ax
 mov es,ax
 mov cx,9
 lea di, vectA
 cld 
 mov si,0
go:
 mov dx,offset mess0
 mov ah,09
 int 21h
 
 mov ah,01h
 int 21h
 sub al,30h
 mov vectA[si],al
 inc si
 loop go 
 
 mov dx,offset mess1
 mov ah,09
 int 21h
       
 call  MODPROG 
 

 mov si,0
 dec bx
 mov cx,bx
 xor ah, ah
 
amean:
add al,vectM[si]
inc si
loop amean

div bl
mov am, al
 

mov si,0
mov cx,bx

show:
mov ah,02h 
mov dl,vectM[si]
add dl,30h 
int 21h
inc si
loop show
 mov dx,offset mess2
 mov ah,09
 int 21h
 mov dl, am
mov ah,02h 
add dl,30h 
int 21h


exit:
 mov ax,4c00h
 int 21h
end main
