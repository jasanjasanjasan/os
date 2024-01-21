mov ah, 0x0e
mov al, 65
int 0x10


loop:
 inc al
 cmp al, 90 + 1
 je exit
 int 0x10
 jmp loop_big

loop_big:
 inc al
 mov bl, al
 add al, 32
 int 0x10
 mov al, bl
 cmp al, 90 + 1
 je exit
 jmp loop

exit:
    jmp $
times 510 - ($-$$) db 0

db 0x55,0xaa