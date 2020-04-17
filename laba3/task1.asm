
.model small
.stack 100h
.data
S dw 10
R db 5
G db 8
L db 2
B dw ?

.code
start:
mov ax,@data 
mov ds,ax    

mov ax,S     
div R

mov cl,G
sub cl,L

mul cl

mov B,ax

mov ah,4ch
int 21h
end start 