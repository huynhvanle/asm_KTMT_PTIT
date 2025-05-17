.model small
.stack 100
.data
   inp db "Nhap ki tu in thuong: $"
   outp db 13,10,"Ki tu in hoa la: $"
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
    
    sub kt,32 ; chenh lech ascii
    mov dl,kt
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    end main
end
    
