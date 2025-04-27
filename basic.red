;redcode
;name BasicWarrior
;author Shreyans Mehta
    org start          ; execution starts here
step    equ 4          ; step size for bomb spacing
bomb    DAT 0, 0       ; the bomb (kills any process that executes it)
start   ADD   #step, ptr   ; increment target pointer by step
ptr     MOV   bomb, @ptr   ; copy the bomb to the target address
        JMP   start        ; repeat indefinitely
        END   start        ; end of warrior
