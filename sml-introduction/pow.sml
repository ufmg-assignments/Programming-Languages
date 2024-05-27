fun pow (x, 0) = 1
  | pow (x:int, y) = x * pow(x, y-1);