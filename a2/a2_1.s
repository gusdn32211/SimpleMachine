.pos 0x100

    # c = 5
    ld $a, r0           # r0 = address of a
    ld $b, r1           # r1 = address of b
    ld $c, r2           # r2 = address of c
    ld 0(r2), r2        # r2 = value of c
    ld $5, r3           # r3 = 5
    st r3, 0(r2)        # c = r3 = 5
    ld 0(r2), r2        # r2 = c

    # b = c + 10
    ld $10, r3          # r3 = 10
    add r2, r3          # r3 = c + 10
    st r3, 0(r1)        # b = r3 = c + 10
    ld 0(r1), r1        # r1 = b

    # a[8] = 8;
    ld $8, r3           # r3 = 8
    st r3, (r0,r3,4)    # a[8] = 8
    ld (r0,r3,4), r3    # r3 = a[8]

    # a[4] = a[4] + 4
    ld $4, r4           # r4 = 4
    ld (r0,r4,4), r5    # r5 = a[4]
    add r4, r5          # r5 = a[4] + 4
    st r5, (r0,r4,4)    # a[4] = a[4] + 4

    # a[b & 0x7]
    ld $7, r4           # r4 = 7
    and r1,r4           # r4 = b & 7
    ld (r0,r4,4), r4    # r4 = a[b & 7]

    # a[c] = a[8] + b + a[b & 0x7];
    add r1,r3           # r3 = a[8] + b
    add r4,r3           # r3 = a[8] + b + a[b & 7]
    st r3, (r0,r2,4)    # a[c] = a[8] + b + a[b & 0x7]

    halt                #halt





.pos 0x200
# Data area

b:  .long 0             # b
c:  .long 0             # c
a:  .long 0             # a[0]
    .long 0             # a[1]
    .long 0             # a[2]
    .long 0             # a[3]
    .long 0             # a[4]
    .long 0             # a[5]
    .long 0             # a[6]
    .long 0             # a[7]
    .long 0             # a[8]
    .long 0             # a[9]