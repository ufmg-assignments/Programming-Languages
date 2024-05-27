datatype dinheiro = Centavos of int | Reais of real |Pessoa_Dinheiro of (string*real);

fun amount (Centavos x) = x
  | amount (Reais x) = (round (100.0*x))
  | amount (Pessoa_Dinheiro (y,x)) = (round (100.0*x));