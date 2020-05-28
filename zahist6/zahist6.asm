  
model small
stack 256
.data
mes0    db   13,10,'Name:  $'
mes1    db   13,10,'Surname:  $'
mes2    db   13,10,'Age:  $'
mes3    db   13,10,'University:  $'
mes4    db   13,10,'First exam:  $'
mes5    db   13,10,'Second exam:  $'
mes6    db   13,10,'Third exam:  $'

stud struc
name db 30 dup(' ')
surname db 30 dup(' ')
Age db 30 dup(' ')
university db 40 dup(' ')
firstExam db 5 dup(' ')
secondExam db 5 dup(' ')
thirdExam db 5 dup(' ')
stud ends
student  stud<'Serhii $','Romash$','18 years old$','Khmelnitskyi NATIONAL UNIVERSITY $','3$','4$','4$'  >
expan stud<>
      
.code

ShowMe proc near
    xor     ax,ax
    xor     bx,bx
    xor     si,si
    mov     cx,4

    mov     bx,si
    mov     dl, 10
    mov     ah, 02h
    int     21h

    mov     ah,09h
    lea     dx,mes0
    int     21h
    lea     dx, student.name[bx]
    int     21h
    
    lea     dx,mes1
    int     21h
    lea     dx, student.surname[bx]
    int     21h
    
    lea     dx,mes2
    int     21h
    lea     dx, student.Age[bx]
    int     21h
    
    lea     dx,mes3
    int     21h
    lea     dx, student.university[bx]
    int     21h
    
    lea     dx,mes4
    int     21h
    lea     dx, student.firstExam[bx]
    int     21h

    lea     dx,mes5
    int     21h
    lea     dx, student.secondExam[bx]
    int     21h
    
    lea     dx,mes6
    int     21h
    lea     dx, student.thirdExam[bx]
    int     21h

ret
endp    
main:
    mov ax,@data
    mov ds,ax
    call ShowMe 
      
exit:
    mov ax,4c00h
    int 21h
    end main