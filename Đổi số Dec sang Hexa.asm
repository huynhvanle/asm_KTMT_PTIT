.model small
.stack 100h
.data
.code
main proc
    mov ax,@data
    mov ds,ax    
    
    mov ax,234 
    call find     
    
    mov ah,4ch
    int 21h            
main endp

find proc
    mov bx,16    
    mov cx,0    
    
    hexa:    
        div bl  ; al / bl => al thuong va ah du
        push ax ; al + ah
        inc cx 
        cmp al,0
        mov ah,0 ; khoi tao lai phan du    
        je result
        jmp hexa  
        
    result:    
        pop ax 
        mov dl,ah 
        
        cmp dl,10      
        je hex_a 
        cmp dl,11
        je hex_b
        cmp dl,12   
        je hex_c
        cmp dl,13   
        je hex_d
        cmp dl,14  
        je hex_e
        cmp dl,15  
        je hex_f 
        
        add dl,'0'  
        jmp print  
        
        hex_a:  
            mov dl,'A'
            jmp print     
        hex_b:  
            mov dl,'B'
            jmp print
        hex_c:  
            mov dl,'C'
            jmp print
        hex_d: 
            mov dl,'D'
            jmp print
        hex_e:  
            mov dl,'E'
            jmp print  
        hex_f:  
            mov dl,'F' 
            jmp print 
     print:  
        mov ah,2
        int 21h        
    loop result
    ret 
find endp
end
