signature Math = 
sig
  val halfPi: real
  val fact: int -> int
  val pow: int * int -> int
  val double: int -> int
end;

exception NegativeValueException;

structure MyMathLib :> Math = 
struct
  val halfPi = 1.57
  fun fact x = if x < 0 then raise NegativeValueException else 
               if x = 0 then 1 else x * fact (x-1) 
  fun pow (x, y) = if x < 0 then raise NegativeValueException else 
                   if y = 0 then 1 else x * pow (x,y-1)
  fun double x = if x < 0 then raise NegativeValueException else 2*x
end;

fun useMyMathLib(x, funct) = 
  let val f = funct in
  case f of
   "pow" => Int.toString(MyMathLib.pow(x, x))
  |"double" => Int.toString(MyMathLib.double(x)) 
  |"fact" => Int.toString(MyMathLib.fact(x))
  end
  handle NegativeValueException => "Nao posso lidar com numeros negativos!";