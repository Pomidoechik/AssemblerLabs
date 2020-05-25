.MODEL small
.STACK 256
.data
mas     dw 4,2,4
        dw 4,1,6
        dw 5,8,9 
        dw 10,11,12       
M dw 4
N dw 3
C dw ?
.code  
Show_AX proc
        push    ax
        push    bx
        push    cx
        push    dx
        push    di
 
        mov     cx, 10
        xor     di, di          
 
        or      ax, ax
        jns     Conv
        push    ax
        mov     dx, '-'
        mov     ah, 2           
        int     21h
        pop     ax
 
        neg     ax
 
Conv:
        xor     dx, dx
        div     cx              
        add     dl, '0'         
        inc     di
        push    dx              
        or      ax, ax
        jnz     Conv
        
Show:
        pop     dx              
        mov     ah, 2           
        int     21h
        dec     di              
        jnz     Show
 
        pop     di
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
 
Show_AX endp
 
main:
 
 mov ax,@data
mov ds, ax 
 
xor bx,bx
 
mov C,0
 
xor ch,ch
 
mov cx,M
 
RowLoop:
xor si,si
push cx
mov cx,N
 
ColLoop:
mov ax, mas[bx][si]
add C, ax; 
 
add si, 2; 
loop ColLoop
xor ah,ah
mov ax,N
sal ax, 1
add bx,ax
pop cx
 
loop RowLoop 
 
mov ax, C
call Show_AX    
 
Exit:
mov ah, 04ch
mov al, 0h
int 21h
end main
