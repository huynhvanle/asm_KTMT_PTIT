.model small
.stack 100h
.data
   inp db "nhap chuoi: $"
   out1 db 13,10,"chuoi in thuong: $"
   out2 db 13,10,"chuoi in hoa: $"
   str db 200 dup('$')
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
    lea dx,out1
    int 21h
    call inthuong
    
    mov ah,9
    lea dx,out2
    int 21h
    call inhoa
    
    mov ah,4ch
    int 21h

main endp
    
inthuong proc
    lea si,str + 2
    check1:
      cmp [si],'A'
      jl in1
      cmp [si],'Z'
      jg in1
      add [si], 32
    in1:
      mov dl,[si]
      mov ah,2
      int 21h
      inc si
      cmp [si],'$'
      jne check1
    ret ; return
inthuong endp

inhoa proc
    lea si, str + 2
    check2:
      cmp [si],'a'
      jl in2
      cmp [si],'z'
      jg in2
      sub [si],32
    in2:
      mov dl,[si]
      mov ah,2
      int 21h 
      inc si
      cmp [si],'$'
      jne check2
    ret;
inhoa endp

end
