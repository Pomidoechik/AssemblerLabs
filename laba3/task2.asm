.model small
.stack 100h
.data
S db 24
R db 4
G db 9
L db 2 
B db ?
.code 
start:
mov ax,@data
mov ds, ax

mov cl, G ; cl=B=9
mov ax, 3 ; ax=3
mul L     ; ax=ax*L=3*2=6   
sub cl,al ; cl=cl-al=9-6=3 

xor ax,ax ; ax=0
mov al,S  ; al=S=24
div R     ; al=al/R=24/4=6 
mul cl    ; al=6*3=18

mov B, al ; B=al=18  

xor ax,ax ; ax=0
xor cx,cx ; cs=0

mov cl, G ; cl=G=9
add cl, L ; cl=cl+L=9+2=11

mov ax,2  ; ax=2
mul S     ; ax=2*24=48
div R     ; ax=48/4=12
mul cl    ; ax=12*11=132

sub B, al ; B=18-132=-114   


mov ah,4ch
int 21h
end start 
