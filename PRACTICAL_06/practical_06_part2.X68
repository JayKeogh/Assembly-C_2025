*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    
    LEA	MESSAGE, A1
	MOVE.B	#14, D0
	TRAP	#15


    SIMHALT             ; halt simulator

MESSAGE	DC.B	'HELLO WORLD',0

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
