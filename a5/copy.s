.pos 0x100
start:           ld $stackBtm, r5         # sp = address of last word of stack
                 inca r5                  # sp = address of word after stack
                 gpc $6, r6               # ra = pc + 6
                 j main                   # call main()
                 halt

.pos 0x200
main:           deca r5                   # allocate callee part of main's frame
                st r6, (r5)               # save ra on stack
                gpc $6, r6                # ra = pc + 6
                j copy                    # call copy()
                ld (r5), r6               # load ra from stack
                inca r5                   # deallocate callee part of main's frame
                j (r6)                    # return

.pos 0x300
copy:           deca r5                   # allocate callee part of copy's frame
                st r6, (r5)               # save ra on stack
                ld   $0xfffffff8, r0      # r0 = -8 = -(size of caller part of dst's frame)
                add r0, r5                # allocate caller part of dst's frame
                ld $0, r7                 # r7 = 0
                ld $i, r1                 # r1 = address of i
                st r7, (r1)               # i = 0
                ld (r1), r1               # r1 = value of i = 0
                ld $src, r2               # r2 = address of src
copy_loop:      ld (r2,r1,4), r3          # r3 = src[i]
                st r3, (r5,r1,4)          # dst[i] = src[i]
                beq r3, copy_end          # while (src[i] !=0)
                inc r1                    # r1 = i++
                j copy_loop               # next while iteration
copy_end:       st r7, (r5,r1,4)          # dst[i] = 0
                ld $8, r0                 # r0 = 8
                add r0, r5                # deallocate caller part of dst's frame
                ld (r5), r6               # load ra from stack
                inca r5                   # remove callee part of stack frame
                j (r6)                    # return

.pos 0x400
i:               .long 0x00000000

.pos 0x500
src:             .long 0x00000001
                 .long 0x00000001
                 .long 0x00001024
                 .long 0x0000ffff
                 .long 0xffff0100
                 .long 0xffffffff
                 .long 0x0200ffff
                 .long 0xffff0300
                 .long 0xffffffff
                 .long 0x0400ffff
                 .long 0xffff0500
                 .long 0xffffffff
                 .long 0x0600ffff
                 .long 0xffff0700
                 .long 0xffffffff
                 .long 0xf0000000


.pos 0x1000
stackTop:        .long 0x00000000
                 .long 0x00000000
                 .long 0x00000000
                 .long 0x00000000
                 .long 0x00000000
                 .long 0x00000000
                 .long 0x00000000
                 .long 0x00000000
                 .long 0x00000000
stackBtm:        .long 0x00000000
