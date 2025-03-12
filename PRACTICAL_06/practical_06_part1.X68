*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    ; Move Trap Task
    MOVE.B #2, D0
    ; Interupt and Trap Task
    Trap #15
    
    LEA MESSAGE, A1
    MOVE.B #13, D0
    TRAP #15
    
END_PROG:

MESSAGE: DC.B 'Trap Task Test', 0

    SIMHALT             ; halt simulator



    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
