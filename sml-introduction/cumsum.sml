fun cumSumAuxiliar (s, []) = [s]
  | cumSumAuxiliar (s, h::t) = s::cumSumAuxiliar(s+h, t);

fun cumSum [] = []
  | cumSum (h::t) = cumSumAuxiliar(h, t);
