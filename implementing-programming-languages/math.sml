signature Math = 
sig
  val halfPi: real
  val fact: int -> int
  val pow: int * int -> int
  val double: int -> int
end;

structure MyMathLib :> Math = 
struct
  val halfPi = 1.57
  fun fact x = if x = 0 then 1 else x * fact (x-1)
  fun pow (x, y) = if y = 0 then 1 else x * pow (x,y-1)
  fun double x = 2*x
end;