ideal
model small
stack 256
dataseg
r dw 34h
codeseg
start:
mov ax, @data
mov ds, ax
mov ax, 65h
mov [r], ax
mov si, [r]
mov bx, 70h
mov [r], bx
mov di, [r]
mov cx, 40h
mov [r], cx
mov bp, [r]
exit:
mov al, 04ch
int 21h
end start