model small
.stack 256
.data 
fN dw 0
sN dw 2
tN dw 10
ans db 'S = $'
mesg1 db 'norma$'
d db 2
S db ?
.code 
begin:
mov ax,@data
mov ds,ax
mov cx, 3

prog:

jcxz exit

cmp cx, 3
je first
cmp cx, 2
je second
cmp cx, 1
je third

first:
mov ax, fN
jmp com 

second:
mov ax, sN
jmp com

third:
mov ax, tN
jmp com

com:
cmp al,0
jbe firstRoad
cmp al,8    
jae thridRoad
cmp al,0
jnb secondRoad
jmp exit

firstRoad:
sub al, 8
jmp output

secondRoad:
div d
add al, al
jmp output

thridRoad:
mul al
mul al
mul al
mul al
mul al
mul al
mul al
mov al, 9
jmp output




output:
lea dx, [ans]
mov ah, 09h
int 21h
mov S, al
mov dx,offset S
mov ah, 02h
int 21h


loop prog

exit:
mov ax,4c00h 
int 21h
end begin