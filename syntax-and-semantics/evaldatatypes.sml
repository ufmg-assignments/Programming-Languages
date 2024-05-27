(* implemente a função eval *)

datatype area = RConst of real | AQuadrado of area | ARetangulo of area * area | ACirculo of area;

fun eval (RConst a) = a
  | eval (AQuadrado l) = (eval l) * (eval l)
  | eval (ARetangulo(b,h)) = (eval b) * (eval h)
  | eval (ACirculo r) = 3.14 * (eval r) * (eval r);