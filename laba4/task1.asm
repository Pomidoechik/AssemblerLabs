model small
.stack 100h
.data
CrLf  db 0Dh, 0Ah, '$'
mesg1 db 'Enter your string: ',0dh,0ah,'$'
mesg db 'Result: ',0dh,0ah,'$'
mesgPressAnyKey db 0Dh, 0Ah, 'Press any key to exit...', '$'
Buffer label byte
MaxLen db 80
StrLen db ?
String db 81 dup(?)
.code
begin:
mov ax,@data
mov ds,ax

lea dx,[mesg1]
mov ah,09h
int 21h
mov ah,0Ah
lea dx,[Buffer]
int 21h
lea dx,[CrLf]
mov ah,09h
int 21h

mov cl,[StrLen]

lea dx,[mesg]
mov ah,09h
int 21h

mov bx,offset String
mov si,bx
add si,cx
add bx,2
output:
mov dl,[bx]
mov ah,02h
int 21h
add bx,3
cmp si,bx
jle break
jmp output

break:
lea dx,[mesgPressAnyKey]
mov ah,09h
int 21h
mov ah,00h
int 16h
mov ax,4C00h
int 21h
end begin