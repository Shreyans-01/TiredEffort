;redcode
;name BasicWarrior
;author Shreyans Mehta
org start

bomb    DAT 0, 0

start   MOV bomb, @2
        ADD #5, start
        JMP start
end start
