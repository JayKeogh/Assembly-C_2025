*-------------------------------------------------------
* STARTING MEMORY ADDRESS FOR THE PROGRAMME $1000
*-------------------------------------------------------
    ORG $1000
*-------------------------------------------------------
* CHOOSE YOUR STARTER POKEMON
*-------------------------------------------------------

*-------------------------------------------------------
* VALIDATION VALUES TO BE USED, MODIFY AS NEEDED
*-------------------------------------------------------
EXIT        EQU 0           ; USED TO EXIT ASSEMBLY PROGRAM
MIN_HP      EQU 1           ; MIN HP FOR POKEMON
MAX_HP      EQU 25          ; MAX HP FOR POKEMON
MIN_ATTACKS EQU 1           ; MIN NUMBER OF ATTACKS
MAX_ATTACKS EQU 4           ; MAX NUMBER OF ATTACKS
WIN_POINT   EQU 5           ; POINTS GAINED ON WINNING A BATTLE
LOSE_POINT  EQU 8           ; POINTS LOST ON LOSING A BATTLE

* START OF GAME
START:
    MOVE.B  #100, $4000     ; PUT POINTS IN MEMORY LOCATION $4000
    LEA     $4000, A3       ; ASSIGN ADDRESS A3 TO THAT MEMORY LOCATION

    BSR     WELCOME         ; BRANCH TO THE WELCOME SUBROUTINE
    ; TODO: Implement choosing a starter Pokémon
    ; TODO: Implement the main game loop
    BSR     GAME            ; BRANCH TO THE GAME SUBROUTINE

* GAME LOOP
    ORG     $3000           ; THE REST OF THE PROGRAM IS TO BE LOCATED FROM 3000 ONWARDS

*-------------------------------------------------------
*-------------------GAME SUBROUTINE---------------------
*-------------------------------------------------------
GAME:
    ; TODO: Implement the main game loop
    RTS                     ; RETURN FROM GAME: SUBROUTINE

END:
    SIMHALT

*-------------------------------------------------------
*-------------------WELCOME SUBROUTINE------------------
*-------------------------------------------------------
WELCOME:
    BSR     ENDL            ; BRANCH TO ENDL SUBROUTINE
    LEA     WELCOME_MSG, A1 ; ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14, D0         ; MOVE LITERAL 14 TO D0
    TRAP    #15             ; TRAP AND INTERPRET VALUE IN D0
    BSR     ENDL            ; BRANCH TO ENDL SUBROUTINE
    BSR     CONTINUE        ; BRANCH TO CONTINUE SUBROUTINE
    RTS                     ; RETURN FROM WELCOME: SUBROUTINE

*-------------------------------------------------------
*---------CHOOSE POKEMON SUBROUTINE---------------------
*-------------------------------------------------------
CHOOSE_POKEMON:
    ; TODO: Implement logic to choose a Pokémon and store the choice
    RTS                     ; RETURN FROM CHOOSE_POKEMON: SUBROUTINE

*-------------------------------------------------------
*----------------GAMELOOP (MAIN LOOP)-------------------
*-------------------------------------------------------
GAMELOOP:
    ; TODO: Implement the main game loop logic
    RTS                     ; RETURN FROM GAMELOOP: SUBROUTINE

*-------------------------------------------------------
*----------------UPDATE QUEST PROGRESS------------------
* COMPLETE QUEST
*-------------------------------------------------------
UPDATE:
    ; TODO: Implement update logic
    RTS

*-------------------------------------------------------
*-----------------DRAW QUEST UPDATES--------------------
* DRAW THE GAME PROGRESS INFORMATION, STATUS REGARDING
* QUEST
*-------------------------------------------------------
DRAW:
    ; TODO: Implement draw logic
    RTS                     ; RETURN FROM DRAW: SUBROUTINE

*-------------------------------------------------------
*--------------------BATTLE SUBROUTINE------------------
*-------------------------------------------------------
BATTLE:
    ; TODO: Implement battle logic
    RTS                     ; RETURN FROM BATTLE: SUBROUTINE

*-------------------------------------------------------
*--------------------ATTACK SUBROUTINE------------------
*-------------------------------------------------------
ATTACK:
    ; TODO: Implement attack logic
    RTS                     ; RETURN FROM ATTACK: SUBROUTINE

*-------------------------------------------------------
*-----------------HEADS UP DISPLAY (SCORE)--------------
*-------------------------------------------------------
HUD:
    ; TODO: Implement HUD logic
    RTS

*-------------------------------------------------------
*-----------------------BEING ATTACKED------------------
* THIS COULD BE USED FOR COLLISION DETECTION
*-------------------------------------------------------
COLLISION:
    ; TODO: Implement collision logic
    RTS                     ; RETURN FROM COLLISION: SUBROUTINE

*-------------------------------------------------------
*--------------------------LOOP-------------------------
*-------------------------------------------------------
LOOP:
    ; TODO: Implement loop logic
    RTS                     ; RETURN FROM LOOP: SUBROUTINE

*-------------------------------------------------------
*------------------SCREEN DECORATION--------------------
*-------------------------------------------------------
DECORATE:
    ; TODO: Implement decoration logic
    RTS                     ; RETURN FROM DECORATE: SUBROUTINE

CLEAR_SCREEN:
    ; TODO: Implement clear screen logic
    RTS                     ; RETURN FROM CLEAR_SCREEN: SUBROUTINE

*-------------------------------------------------------
*------------------------REPLAY-------------------------
*-------------------------------------------------------
REPLAY:
    ; TODO: Implement replay logic
    RTS                     ; RETURN FROM REPLAY: SUBROUTINE

*-------------------------------------------------------
*------------------------CONTINUE-------------------------
*-------------------------------------------------------
CONTINUE:
    BSR     ENDL            ; BRANCH TO ENDL SUBROUTINE
    LEA     CONTINUE_MSG, A1 ; ASSIGN MESSAGE TO ADDRESS REGISTER A1
    MOVE.B  #14, D0         ; MOVE LITERAL 14 TO D0
    TRAP    #15             ; TRAP AND INTERPRET VALUE IN D0

    MOVE.B  #4, D0          ; MOVE LITERAL 4 TO D0
    TRAP    #15             ; TRAP AND INTERPRET VALUE IN D0
    RTS                     ; RETURN FROM SUBROUTINE

ENDL:
    MOVEM.L D0/A1, -(A7)    ; SAVE D0 AND A1
    MOVE    #14, D0         ; MOVE LITERAL 14 TO D0
    LEA     CRLF, A1        ; ASSIGN CRLF TO ADDRESS REGISTER A1
    TRAP    #15             ; TRAP AND INTERPRET VALUE IN D0
    MOVEM.L (A7)+, D0/A1    ; RESTORE D0 AND A1
    RTS                     ; RETURN FROM ENDL: SUBROUTINE

*-------------------------------------------------------
*-------------------DATA DECLARATIONS--------------------
*-------------------------------------------------------

CRLF:           DC.B    $0D, $0A, 0
WELCOME_MSG:    DC.B    '************************************************************'
                DC.B    $0D, $0A
                DC.B    'WELCOME TO THE POKEMON WORLD! '
                DC.B    $0D, $0A
                DC.B    'CHOOSE YOUR STARTER POKEMON:'
                DC.B    $0D, $0A
                DC.B    '1. PIKACHU (ELECTRIC TYPE)'
                DC.B    $0D, $0A
                DC.B    '2. BULBASAUR (GRASS TYPE)'
                DC.B    $0D, $0A
                DC.B    '3. CHARMANDER (FIRE TYPE)'
                DC.B    $0D, $0A
                DC.B    '************************************************************'
                DC.B    $0D, $0A, 0
CHOOSE_MSG:     DC.B    'ENTER THE NUMBER OF YOUR CHOICE: ', 0
BATTLE_MSG:     DC.B    'A WILD POKEMON APPEARED!', 0
ATTACK_MSG:     DC.B    'CHOOSE AN ATTACK: 1. TACKLE 2. SPECIAL MOVE', 0
UPDATE_MSG:     DC.B    'UPDATING BATTLE STATUS...', 0
DRAW_MSG:       DC.B    'REDRAWING BATTLE SCENE...', 0
HIT_MSG:        DC.B    'YOUR POKEMON WAS HIT!', 0
MISS_MSG:       DC.B    'YOUR POKEMON DODGED THE ATTACK!', 0
LOOP_MSG:       DC.B    '.', 0
REPLAY_MSG:     DC.B    'ENTER 0 TO QUIT, ANY OTHER NUMBER TO REPLAY: ', 0
CONTINUE_MSG:   DC.B    'PRESS ANY KEY TO CONTINUE: ', 0
HUD_MSG:        DC.B    'SCORE: ', 0
HEALTH:         DS.W    1   ; PLAYER'S HEALTH
SCORE:          DS.W    1   ; RESERVE SPACE FOR SCORE

    END START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
