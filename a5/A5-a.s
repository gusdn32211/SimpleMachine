.pos 0x0
                 ld   $sb, r5               # sp = address of last word of stack
                 inca r5                    # sp = address of word after stack
                 gpc  $6, r6                # ra = pc + 6
                 j    0x300                 # call foo()
                 halt                     
.pos 0x100
x:               .long 0x00001000
.pos 0x200
ping:            ld   0x0(r5), r0           # r0 = a0
                 ld   0x4(r5), r1           # r1 = a1
                 ld   $0x100, r2            # r2 = address of x
                 ld   0x0(r2), r2           # r2 = value of x
                 ld   (r2, r1, 4), r3       # r3 = x[a1]
                 add  r3, r0                # r0 = a0 + x[a1]
                 st   r0, (r2, r1, 4)       # x[a1] = a0 + x[a1]
                 j    0x0(r6)               # return
.pos 0x300
foo:             ld   $0xfffffff4, r0       # r0 = -12 = -(size of callee part of foo's frame)
                 add  r0, r5                # allocate callee part of foo's frame
                 st   r6, 0x8(r5)           # save ra on stack
                 ld   $0x1, r0              # r0 = 1 value of first arg (a0)
                 st   r0, 0x0(r5)           # save first arg on stack
                 ld   $0x2, r0              # r0 = 2 value of second arg (a1)
                 st   r0, 0x4(r5)           # save second arg on stack
                 ld   $0xfffffff8, r0       # r0 = -8 = -(size of caller part of ping's frame)
                 add  r0, r5                # allocate caller part of ping's frame
                 ld   $0x3, r0              # r0 = 3 value of first arg (a0)
                 st   r0, 0x0(r5)           # save first arg on stack
                 ld   $0x4, r0              # r0 = 4 value of second arg (a1)
                 st   r0, 0x4(r5)           # save second arg on stack
                 gpc  $6, r6                # ra = pc + 6
                 j    0x200                 # call ping(a0, a1)
                 ld   $0x8, r0              # r0 = 8 = size of caller part of ping's frame
                 add  r0, r5                # deallocate caller part of ping's frame
                 ld   0x0(r5), r1           # r1 = a0
                 ld   0x4(r5), r2           # r2 = a1
                 ld   $0xfffffff8, r0       # r0 = -8 = -(size of caller part of ping's frame)
                 add  r0, r5                # allocate caller part of ping's frame
                 st   r1, 0x0(r5)           # a0 = a0
                 st   r2, 0x4(r5)           # a1 = a1
                 gpc  $6, r6                # ra = pc + 6
                 j    0x200                 # call ping(a0, a1)
                 ld   $0x8, r0              # r0 = 8 = size of caller part of ping's frame
                 add  r0, r5                # deallocate caller part of ping's frame
                 ld   0x8(r5), r6           # load return address from stack
                 ld   $0xc, r0              # r0 = 12 size of callee part of foo's frame
                 add  r0, r5                # deallocate callee parts of foo's frame
                 j    0x0(r6)               # return
.pos 0x1000
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
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
