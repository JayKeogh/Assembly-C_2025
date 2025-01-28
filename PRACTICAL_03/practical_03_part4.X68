*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    
    LEA PLAYER_POINTS, A1
    ADD.B #20, (A1)
    
    LEA PLAYER_HEALTH, A2
    SUB.B #10, (A2)
    
    LEA BOSS_HEALTH, A3
    MOVE.B ATTACK1, D1
    SUB.B D1, (A3)
    
    
    

    SIMHALT             ; halt simulator

PLAYER_POINTS dc.b 50
PLAYER_HEALTH dc.b 100
BOSS_HEALTH dc.b 100
ATTACK1 dc.b 75
ATTACK2 dc.b 90
ULTIMATE dc.b 200


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
