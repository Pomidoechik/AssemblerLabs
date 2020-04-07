; Programm Hello3
.model small
.stack 100h
.data
Hello db 'Ny privet assembler!$'
.code
start:
mov ax, @data
mov ds, ax
LEA dx, Hello
mov ah, 09h
int 21h
mov ax, 4c00h
int 21h
end start