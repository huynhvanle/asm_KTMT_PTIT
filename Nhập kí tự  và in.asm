.model small
.stack 100
.data
   inp db "nhap ki tu: $"
   outp db 13,10,"ki tu da nhap la: $"
   kt db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx,inp
    int 21h
    
    mov ah,1
    int 21h
    
    mov kt,al
    
    mov ah,9
    lea dx,outp
    int 21h
    
    mov dl,kt
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    end main
end
 
