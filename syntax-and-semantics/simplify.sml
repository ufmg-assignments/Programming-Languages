(* implemente a função simplify *)

datatype UnOp = Not;
datatype BinOp = Add | Sub | Mul | Or | Eq | Gt;

datatype Sexpr = IConst of int | Op1 of UnOp * Sexpr | Op2 of BinOp * Sexpr * Sexpr;

fun simplify (IConst i) = IConst i
  | simplify (Op2(Gt, e1, e2)) = Op2(Gt, (simplify e1), (simplify e2))
  | simplify (Op2(Eq, e1, e2)) = Op2(Eq, (simplify e1), (simplify e2))
  | simplify (Op2(Add, e1, e2)) =
    let val v1 = simplify e1 val v2 = simplify e2 in
      if v1 = IConst 0 then 
        v2 
      else 
        if v2 = IConst 0 then 
          v1 
        else Op2(Add, v1, v2)
    end
  | simplify (Op2(Sub, e1, e2)) =
    let val v1 = simplify e1 val v2 = simplify e2 in
      if v1 = v2 then 
        IConst 0
       else 
         if v2 = IConst 0 then
           v1
         else Op2(Sub, v1, v2)
    end
  | simplify (Op2(Mul, e1, e2)) =
    let val v1 = simplify e1 val v2 = simplify e2 in
      if v1 = IConst 1 then 
        v2 
      else 
        if v2 = IConst 1 then 
          v1 
        else 
           if v1 = IConst 0 then
            IConst 0
           else 
            if v2 = IConst 0 then
              IConst 0
            else Op2(Mul, v1, v2)
    end
  | simplify (Op2(Or, e1, e2)) =
    let val v1 = simplify e1 val v2 = simplify e2 in
      if v1 = v2 then
        v1
      else Op2(Or, v1, v2)
    end
  | simplify (Op1(Not, i)) =
      case i of 
        (Op1(Not, ex)) => simplify(ex)
      | (IConst x) => (Op1(Not, i))
      | (Op2(bin, e1, e2)) => 
        let val v1 = simplify e1 val v2 = simplify e2 in
          let val v = simplify (Op2(bin, v1, v2)) in
          case v of
          (IConst x2) => (Op1(Not, v))
        | (Op1(Not, ex2)) => ex2
        | (Op2(bin2, e3, e4)) => Op1(Not, v)
        end
      end;