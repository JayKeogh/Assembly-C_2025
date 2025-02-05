*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    ;Move health to memory location $3000
    MOVE.B #100, $3000
    
    ;Load memory address $3000 into
    ;Address register A1
    LEA     $3000, A1
    
    ;Hit by NPC
    ;Non player character
    SUB.B   #20, (A1)
    
    ;Pickup health found
    ADD.B   #10, (A1)

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
