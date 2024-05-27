fun maximoAuxiliar (n, []) = n
  | maximoAuxiliar (n, h::t) = if n > h then maximoAuxiliar(n, t) else maximoAuxiliar(h,t)
    
fun max [] = 0
  | max l = maximoAuxiliar(hd l, tl l);
