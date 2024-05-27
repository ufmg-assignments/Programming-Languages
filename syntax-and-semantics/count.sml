fun count_main ( x : int) = 
    let fun count(n) =
       if n = x +1 then
         []
       else n::count(n+1) in
        count(1)
     end;