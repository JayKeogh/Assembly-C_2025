*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    MOVE.L #100, D1
    MOVE.L D1, $1000
    
    MOVE.B #$64, D2
    MOVE.B  D2, $2000
    
    MOVE.W #%101001, D3
    MOVE.W D3, $3000
    
    MOVE.L #200, D4
    MOVE.L D4, $4000
    
    MOVE.B #$77, D5
    MOVE.B  D5, $5000
    
    MOVE.W #%101101, D6    
    MOVE.W D6, $6000
    
    MOVE.L #300, D7
    MOVE.L D7, $7000
    
    MOVE.B #$90, D4
    MOVE.B  D4, $8000
    
    MOVE.W #%101001001, D5
    MOVE.W D5, $9000
    
    MOVE.L #400, D2
    MOVE.L D2, $10000
    
    MOVE.B #$80, D1
    MOVE.B  D1, $11000
    
    MOVE.W #%10111101, D3    
    MOVE.W D3, $12000


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
