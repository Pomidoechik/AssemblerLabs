.MODEL SMALL
.CODE
ORG 256
begin:
jmp start
r dw 34h
start: 
MOV ax, 65h
MOV [r], ax
MOV si, [r]
MOV bx, 70h
MOV [r], bx
MOV di, [r]
MOV cx, 40h
MOV [r], cx
MOV bp, [r]
mov ah, 4ch
MOV al, 00h
int 21h
end begin