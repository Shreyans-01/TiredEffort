;redcode
;name ReplicatorBomber
;author Shreyans Mehta
;strategy Splits rapidly and bombs aggressively

org start

step1   equ 4
step2   equ 7

start   SPL bomber1
bomber1 SPL bomber2
bomber2 SPL bomber3
bomber3 MOV bomb, @2
        ADD #step1, bomber3
        JMP bomber3

bomb    DAT 0, 0
end start
