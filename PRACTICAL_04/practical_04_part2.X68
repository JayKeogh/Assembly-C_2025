*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    ;move health to memory location $3000
    MOVE.B  #100, $3000
    
    ;Load memory of player into data register
    ;X first byte 0 to 15
    ;Y second byte 0 to 15
    MOVE.B  #$12, D2
    
    ;Move lcoation of NPC into data register
    ;X first byte 0 to 15
    ;Y second byte 0 to 15
    MOVE.B  $22, D3
    
    ;Bitwise and D2 and D3
    ;Whats new location of player
    AND.B D2, D3
    
    ;Load memory address $3000 into
    ;Address register A1
    LEA $3000, A1
    
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
