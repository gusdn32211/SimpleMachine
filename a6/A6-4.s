.pos 0x0
                 ld   $0x1028, r5          #r5 = &1028
                 ld   $0xfffffff4, r0      #r0 = -12
                 add  r0, r5               #allocate space on stack
                 ld   $0x200, r0           #r0 = 200, value of first arg
                 ld   0x0(r0), r0          #a = 200
                 st   r0, 0x0(r5)          #save first arg on stack
                 ld   $0x204, r0           #r0 = 204, value of second arg
                 ld   0x0(r0), r0          #b = 204
                 st   r0, 0x4(r5)          #save second arg on stack
                 ld   $0x208, r0           #r0 = 208, value of third arg
                 ld   0x0(r0), r0          #c = 204
                 st   r0, 0x8(r5)          #save third arg on stack
                 gpc  $6, r6               #ra = pc + 6
                 j    0x300                #j 0x300(a,b,c)
                 ld   $0x20c, r1           #r1 = &524
                 st   r0, 0x0(r1)          #r1 = b
                 halt                     
.pos 0x200
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
                 .long 0x00000000         
.pos 0x300
                 ld   0x0(r5), r0         #r0 = a
                 ld   0x4(r5), r1         #r1 = b
                 ld   0x8(r5), r2         #r2 = c
                 ld   $0xfffffff6, r3     #r3 = -10
                 add  r3, r0              #r0 = a-10
                 mov  r0, r3              #r3 = a-10
                 not  r3                  #~(a-10)
                 inc  r3                  #r3 = -(a-10)
                 bgt  r3, L6              #if (a < 10), go to L6
                 mov  r0, r3              #r3 = a-10
                 ld   $0xfffffff8, r4     #r4 = -8
                 add  r4, r3              #r3 = a-18
                 bgt  r3, L6              #if (a > 18), go to L6
                 ld   $0x400, r3          #r3 = &400 = d
                 j    *(r3, r0, 4)        #j (d[a-10])
.pos 0x330
                 add  r1, r2              #r2 = b + c
                 br   L7                  #br L7
                 not  r2                  #~(b+c)
                 inc  r2                  #r2 = -(b+c)
                 add  r1, r2              #r2 = -b+b-c
                 br   L7                  # br L7
                 not  r2                  #~c
                 inc  r2                  #r2 = c
                 add  r1, r2              #r2 = b+c
                 bgt  r2, L0              # if (b+c) > 0, goto L0
                 ld   $0x0, r2            #r2 = 0
                 br   L1                  #br L1
L0:              ld   $0x1, r2            #r2 = 1
L1:              br   L7                  #br L7
                 not  r1                  #~b
                 inc  r1                  #-b
                 add  r2, r1              #r1 = c+b-b
                 bgt  r1, L2              #if (c>0), goto L2
                 ld   $0x0, r2            #r2 = 0
                 br   L3                  #br L3
L2:              ld   $0x1, r2            #r2 = 1
L3:              br   L7                  #br L7
                 not  r2                  #~c
                 inc  r2                  #-c
                 add  r1, r2              #b-c
                 beq  r2, L4              #if (b>c), go to L4
                 ld   $0x0, r2            #r2 = 0
                 br   L5                  #br l5
L4:              ld   $0x1, r2            #r2 = 1
L5:              br   L7                  #br L7
L6:              ld   $0x0, r2            #r2 = 0
                 br   L7                  #br L7
L7:              mov  r2, r0              #r0 = c
                 j    0x0(r6)           #return
.pos 0x400
                 .long 0x00000330         
                 .long 0x00000384         
                 .long 0x00000334         
                 .long 0x00000384         
                 .long 0x0000033c         
                 .long 0x00000384         
                 .long 0x00000354         
                 .long 0x00000384         
                 .long 0x0000036c         
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
