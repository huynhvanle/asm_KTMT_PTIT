.model small
.stack 100h
.data
   inp db 13,10,"Nhap chuoi ki tu: $" 
   outp db 13,10,"Chieu dai chuoi la: $"
   str db 100 dup('$') 
.code
main proc
   mov ax,@data
   mov ds,ax

   mov ah,9
   lea dx,inp
   int 21h 

   mov ah,10
   lea dx,str
   int 21h

   mov ah,9
   lea dx,outp
   int 21h

   ; Tinh chieu dai chuoi
   mov ax,0 ; reset ax
   mov cx,0
   mov al,str + 1
   mov bx,10

   find:
   mov dx,0
   div bx
   push dx
   inc cx
   cmp ax,0
   jne find
 
   rs:
   pop dx
   add dx, '0'
   mov ah, 2
   int 21h
   loop rs

   mov ah, 4ch
   int 21h
main endp
end
