.pos 0x1000
code:

#v = s.x[i];
    ld $i, r0       #r0 = address of i
    ld 0(r0), r0    #r0 = value of i
    ld $v, r1       #r1 = address of v
    ld $s, r2       #r1 = address of s
    ld 0(r2), r2    #r2 = s.x
    ld (r2,r0,4),r3 #r3 = s.x[i]
    st r3, 0(r1)    #v = s.x[i]

#v = s.y[i];
    ld $i, r0       #r0 = address of i
    ld 0(r0),r0     #r0 = value of i
    ld $v, r1       #r1 = address of v
    ld $heap0, r2   #r2 = address of heap0 = s.y
    ld 0(r2),r2     #r2 = s.y
    ld (r2,r0,4),r3 #r3 = s.y[i]
    st r3, 0(r1)    #v = s.y[i]

#v = s.z->x[i]
    ld $i, r0       #r0 = address of i
    ld 0(r0), r0    #r0 = value of i
    ld $v, r1       #r1 = address of v
    ld $heap1, r2   #r2 = address of heap1 = s.z->x
    ld 0(r2),r2     #r2 = s.z->x
    ld (r2,r0,4),r3 #r3 = s.z->x[i]
    st r3, 0(r1)    #v = s.z->x[i]
halt

.pos 0x2000
static:
i:          .long 0 #i
v:          .long 0 #v
s:          .long 0 #x[0]
            .long 0 #x[1]
            .long 0 #y
            .long 0 #z
.pos 0x3000
heap0:      .long 0 #s.y[0]
            .long 0 #s.y[1]
heap1:      .long 0 #s.z->x[0]
            .long 0 #s.z->x[1]
            .long 0 #s.z->y
            .long 0 #s.z->z
