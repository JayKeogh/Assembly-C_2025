*-----------------------------------------------------------
* Title      : 
* Written by : 
* Date       : 
* Description: 
*              
*-----------------------------------------------------------

    ORG    $1000            ; Starting address of the program

START:                      ; First instruction of program

* Initialize values
    MOVE.W  #$64, D0        ; Player Health (100%)
    MOVE.W  #$0, D1         ; Player Points (0)
    MOVE.W  #$A, D2         ; Player X Position (10)
    MOVE.W  #$F, D3         ; Boss X Position (15)

* Main Game Loop
MainLoop:
    CMP.W   D2, D3          ; Compare Player X with Boss X
    BEQ     AttackBoss      ; If PlayerX == BossX, attack Boss

    BRA     MainLoop        ; Otherwise, keep checking

* Attack Boss Logic
AttackBoss:
    SUBI.W  #10, D0         ; Reduce Boss Health by 10
    ADDI.W  #1, D1          ; Increase Player Points by 1
    BRA     MainLoop        ; Loop back to checking if Player is in range

* Halt the program
SIMHALT                    ; Halt simulator

    END    START            ; Last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
