;redcode
;name AdvancedWarrior
;author Shreyans Mehta
    org start
step1   equ 4             ; step for first bomber
step2   equ 5             ; step for second bomber (offset step)
start   SPL   second      ; split to start second bomber process
first   ADD   #step1, p1   ; 1st process: increment pointer by step1
p1      MOV   bomb, @p1    ; place bomb at target address
        JMP   first        ; loop 1st bomber
second  ADD   #step2, p2   ; 2nd process: increment pointer by step2
p2      MOV   bomb, @p2    ; place bomb at target address
        JMP   second       ; loop 2nd bomber
bomb    DAT   0, 0         ; the bomb for both processes
        END   start
