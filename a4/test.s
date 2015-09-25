L0:
	ld 	$0x10,	r0	        # r0 = 0
        beq     r0,  L2                 # if r0 = 0 goto L2
        br      L1                      # if r0 != 0 goto L1
L1:
        ld      $0, r0                  # r0 = 10
        bgt     r0,  L2                 # if r0 > 0 goto L2 (doesn't work)
        ld      $5,  r0                 # r0 = 5
        bgt     r0,  L2                 # if r0 > 0 goto L2
L2:
        j       L3                      # jump to L3
L3:
        gpc     $0x6,  r6               # r6 = pc + 6
        ld      $0x4000, r1             # r1 = 0x4000
        j       0x0(r1)                 # jump to 0x4000
		halt