
ld $0x200, r0 # load 0x200 into r0
ld $0x204, r1 # load 0x204 into r1
ld $0x208, r2 # load 0x208 into r2
st r1, 4(r0) # store value of r1 to 0x4 of r0
ld 4(r0), r3 # load value of memory 0x4 of r0 to r3
st r3, (r2,r3,4) # store value of r3 into address  r2 + r3 * 4
ld (r2, r3, 4), r4 # load value of address r2 + r3 * 4 into r4
mov r0, r5 # move the value of r0 to r5
add r0, r1 # add value of r0 to r1
and r0, r2 # and hexadecimal representation of r0 and r2 then display in r2
inc r5 # increase value of r5 by 1
inca r5 # increase value of r5 by 4
dec r5 # decrease value of r5 by 1
deca r5 # decrease value of r5 by 4
ld $0x00000001, r7 # load 1 into r7
not r7 # not the initial value of r7 then display in r7
ld $100, r6 # load 100 into r6
shl $1, r6 # shift the bits of value of r6 to the left by 1 then show in r6
shr $1,  r6 # shift the bits of value of r6 to the right by 1 then show in r6
halt