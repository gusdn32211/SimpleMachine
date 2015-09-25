    //
// THIS IS THE SOLUTION TO ASSIGNMENT CPSC 213 6.
// Do not share this code with anyone outside of class.
//
int foo (int f, int i, int j) {
  int r;
  switch (f) {
    case 10:
      r = i + j;
      break;
    case 12:
      r = i - j;
      break;
    case 14:
      if (i>j)
	r = 1;
      else
	r = 0;
      break;
    case 16:
      if (i<j)
	r = 1;
      else 
	r = 0;
      break;
    case 18:
      if (i==j)
	r = 1;
      else 
	r = 0;
      break;
    default:
      r = 0;
  }
  return r;
}

