(* implemente a função eval *)

datatype perimetro  = RConst of real | PQuadrado of perimetro | PRetangulo of perimetro * perimetro | PCirculo of perimetro | PTriangulo of perimetro * perimetro * perimetro;

fun eval (RConst p) = p
  | eval (PQuadrado l) = 4.0 * (eval l)
  | eval (PRetangulo(b,h)) = 2.0 * (eval b) +  2.0 * (eval h)
  | eval (PCirculo r) = 2.0 * 3.14 * (eval r)
  | eval (PTriangulo(l1,l2,l3)) = (eval l1) + (eval l2) + (eval l3);