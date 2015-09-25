#
# THIS IS THE SOLUTION TO QUESTIONS 4 and 5 OF ASSIGNMENT 5.
# YOU MAY NOT USE THIS CODE IN ANY WAY WHEN WORKING ON THE ASSIGNMENT.
#

.pos 0x100
start:
    ld $0x8000, r5     # init stack pointer
    gpc $6, r6
    j main             # call main()
    halt               # end

main:
    deca r5
    st r6, (r5)        # save RA
    gpc $6, r6
    j copy             # call copy()
    ld (r5), r6
    inca r5            # pop RA
    j (r6)             # return

copy:
    deca r5
    st r6, (r5)        # save RA
    deca r5
    deca r5            # allocate dst[2]
    ld $0, r0          # r0 (i) = 0
    ld $src, r1        # r1 = &src
loop_body:
    ld (r1,r0,4), r2   # r2 = src[i]
    beq r2, loop_end   # done?
    st r2, (r5,r0,4)   # dst[i] = src[i]
    inc r0             # i++
    br loop_body
loop_end:
    st r2, (r5,r0,4)   # dst[i] = 0 (since r2 will be 0 at this point)
    inca r5
    inca r5            # deallocate dst
    ld (r5), r6
    inca r5            # restore RA
    j (r6)             # return

# data
.pos 0x1000
src:
    .long 1            # src[0]
    .long 1            # src[1]
    .long 0x7ffc       # overwritten return address
    .long 0x0000FFFF   # ld $0xffffffff, r0
    .long 0xFFFF6001   # ...mov r0, r1
    .long 0x60126023   # mov r1, r2 ; mov r2, r3
    .long 0x60346045   # mov r3, r4 ; mov r4, r5
    .long 0x60566067   # mov r5, r6 ; mov r6, r7
    .long 0xF0000000   # halt;
    .long 0            # to terminate copy

# stack
.pos 0x7fe0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
    .long 0
