[org  0x7c00]
mov ah, 0x0e
mov bx, buffer

char:
 db 0
 mov ah, 0
 int 0x16
 mov al, [char]

buffer:
 times 10 db 0
 mov bx, buffer
 mov [bx], al
 inc bx

cmp bx, 10
je print

jmp end 

print:
 mov al, [bx]
 cmp al, 0
 je end
 int 0x10
 inc bx
 jmp print

end:
 jmp $

text:
 db "the man didnt know he was all ready dead", 0

times 510 - ($-$$) db 0
db 0x55,0xaa
