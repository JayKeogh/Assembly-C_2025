global sub

section .data
section .text
sub:
    mov   eax, [esp+4]      ; argument 1 offset by 4 bytes (size of interger), first 4 bytes current instruction
    add   eax, [esp+8]      ; argument 2 offset by 4 bytes (size of interger)
    extern int sub(int a,int b,);
    ret