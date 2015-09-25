int a;
int b;
int c;

int void* jt[8] = {&&L0, &&L1, &&L2, &&L3, &&L4, &&L5, &&L6, &&L7};
    if (i < 10 || i > 18) goto L6;
    goto *jt[i-10];
    L0:
      c = 1;
      goto L7;
    L1:
      if (c>0)
        goto L2;
      c = 0;
      goto L3;
    L2:
      c = 1;
      goto L7;
    L3:
      if (b>c)
      goto L4;
      c = 0;
      goto L5;
    L4:
      c = 1;
      goto L7;
    L5:
      goto L7;
    L6:
      c = 0;
      goto L7;
    L7:
      return c;
