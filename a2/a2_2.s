.pos 0x100

# a[i] = a[i+1] + b[i+2];
    ld $a, r0           # r0 = address of a
    ld $b, r1           # r1 = address of b
    ld $c, r2           # r2 = address of c
    ld $d, r3           # r3 = address of d
    ld $i, r4           # r4 = address of i
    ld 0(r4), r4        # r4 = value of i
    ld $1, r5           # r5 = 1
    ld $2, r6           # r6 = 2
    add r4, r5          # r5 = i + 1
    add r4, r6          # r6 = i + 2
    ld (r0, r5, 4), r5  # r5 = a[i+1]
    ld (r1, r6, 4), r6  # r6 = b[i+2]
    add r6, r5          # r5 = a[i+1] + b[i+2]
    st r5, (r0, r4, 4)  # a[i] = r5 = a[i+1] + b[i+2]

# d[i] = a[i] + b[i]
    ld (r0,r4,4), r5    # r5 = a[i]
    ld (r1,r4,4), r6    # r6 = b[i]
    add r6, r5          # r5 = a[i] + b[i]
    st r5, (r3,r4,4)    # d[i] = r5 = a[i] + b[i]

# d[i] = a[b[i]] + b[a[i]];
    ld (r0,r4,4), r5    # r5 = a[i]
    ld (r1,r4,4), r6    # r6 = b[i]
    ld (r0,r6,4), r6    # r6 = a[b[i]]
    ld (r1,r5,4), r5    # r5 = b[a[i]]
    add r5, r6          # r6 = a[b[i]] + b[a[i]]
    st r6, (r3,r4,4)    # d[i] = r6 = a[b[i]] + b[a[i]]

# d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i];
    ld $3, r5           # r5 = 3
    and r4,r5           # r5 = i & 3
    ld (r0,r5,4), r6    # r6 = a[i & 3]
    ld (r1,r6,4), r6    # r6 = b[a[i & 3]]
    ld (r1,r5,4), r5    # r5 = b[i & 3]
    ld (r0,r5,4), r5    # r5 = a[b[i &3]]
    ld $3, r7            # r7 = 3
    and r7,r5           # r5 = a[b[i & 3]] & 3
    not r5              # r5 = ~a[b[i & 3]] & 3
    inc r5              # r5 = ~a[b[i & 3]] & 3 + 1
    ld (r3,r4,4), r7    # r7 = d[i]
    add r5,r6           # r6 = b[a[i & 3]]  - a[b[i & 3]] & 3
    add r7,r6           # r6 = b[a[i & 3]]  - a[b[i & 3]] & 3 + d[i]
    ld (r1,r4,4), r2    # r2 = b[i]
    st r6, (r3,r2,4)    # d[b[i]] = r6 = b[a[i & 3]]  - a[b[i & 3]] & 3 + d[i]

    halt                # halt




.pos 0x200
# Data area

a:  .long 0             # a[0]
    .long 0             # a[1]
    .long 0             # a[2]
    .long 0             # a[3]
    .long 0             # a[4]
    .long 0             # a[5]
    .long 0             # a[6]
    .long 0             # a[7]

b:  .long 0             # b[0]
    .long 0             # b[1]
    .long 0             # b[2]
    .long 0             # b[3]
    .long 0             # b[4]
    .long 0             # b[5]
    .long 0             # b[6]
    .long 0             # b[7]

c:  .long 0             # c[0]
    .long 0             # c[1]
    .long 0             # c[2]
    .long 0             # c[3]
    .long 0             # c[4]
    .long 0             # c[5]
    .long 0             # c[6]
    .long 0             # c[7]
i:  .long 0             # i
d:  .long c             # d

