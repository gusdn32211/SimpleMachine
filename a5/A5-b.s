.pos 0x100
start:
    ld $sb, r5                  # sp = address of last word of stack
    inca    r5                  # sp = address of word after stack
    gpc $6, r6                  # ra = pc + 6
    j main                      # call main()
    halt

f:
    deca r5                     # allocate callee part of f's frame
    ld $0, r0                   # r0 = j = 0
    ld 4(r5), r1                # r1 = x[i] = a0
    ld $0x80000000, r2          # r2 = 0x80000000
f_loop:
    beq r1, f_end               # while (a0 != 0)
    mov r1, r3                  # r3 = a0
    and r2, r3                  # r3 = a0 and 0x80000000
    beq r3, f_if1               # if ((a0 & 0x80000000) != 0)
    inc r0                      # j++
f_if1:
    shl $1, r1                  # shift r1 left by 1
    br f_loop                   # go to f_loop
f_end:
    inca r5                     # deallocate callee part of f's frame
    j(r6)                       # return

main:
    deca r5                     # allocate callee part of main's frame
    deca r5                     # allocate callee part of main's frame
    st r6, 4(r5)                # save ra on stack
    ld $8, r4                   # r4 = i = 8
main_loop:
    beq r4, main_end            # while (i != 0)
    dec r4                      # r4 = i--
    ld $x, r0                   # r0 = address of x
    ld (r0,r4,4), r0            # r0 = x[i] (a0)
    deca r5                     # allocate callee part of main's frame
    st r0, (r5)                 # save arguments on stack
    gpc $6, r6                  # ra = pc + 6
    j f                         # call f(a0)
    inca r5                     # remove callee part of main's frame
    ld $y, r1                   # r1 = address of y
    st r0, (r1,r4,4)            # y[i] = x[i]
    br main_loop                # go to main_loop
main_end:
    ld 4(r5), r6                # load ra to stack
    inca r5                     # remove callee part of main's frame
    inca r5                     # remove callee part of main's frame
    j (r6)                      # return

.pos 0x2000
x:
    .long 1
    .long 2
    .long 3
    .long 0xffffffff
    .long 0xfffffffe
    .long 0
    .long 184
    .long 340057058

y:
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0

.pos 0x8000
# These are here so you can see (some of) the stack contents.
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
sb: .long 0

