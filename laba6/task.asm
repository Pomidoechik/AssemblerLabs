model small
stack 256
.data
Stud struc
names db 10 dup(' ')
fexam dw ?
sexam dw ?
texam dw ?
foexam dw ?
fiexam dw ?
total  dw ?
Stud ends
step = 22
studs Stud <'T$',4,3,5,5,4,0>
       Stud <'J$',5,5,5,5,5,0>
       Stud <'L$',3,5,5,5,5,0>
       Stud <'M$',5,4,5,2,5,0>
expan Stud <>
.code
FindTheBestStudents proc near
    xor     ax,ax
    xor     bx,bx
    xor     si,si
    mov     cx,5

loop1:
    mov     ax, 0
    mov     bx,si
    add     ax,studs.fexam[bx]
    add     ax,studs.sexam[bx]
    add     ax,studs.texam[bx]
    add     ax,studs.foexam[bx]
    add     ax,studs.fiexam[bx]
    mov     studs.total[bx], ax    
    add     si, step
    loop    loop1
    
ret
endp

ShowTheBestStudents proc near
    xor     ax,ax
    xor     bx,bx
    xor     si,si
    mov     cx,5
    
    
    loop2:
    mov     ax, 0
    mov     bx,si
    mov     ax, studs.total[bx]
    cmp     ax, 25
    jne     nextStud
    


    mov     ah,09h
    lea     dx, studs.names[bx]
    int     21h
    
    add     si, step
    loop    loop1
    
    
    nextStud:
    add     si, step
    loop    loop2
    
ret
endp
    
    
main:
    mov ax,@data
    mov ds,ax
    call FindTheBestStudents 
    call ShowTheBestStudents 
      
exit:
    mov ax,4c00h
    int 21h
    end main