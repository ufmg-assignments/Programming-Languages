fun split ([]) = ([],[])
  | split (h::[]) = (h::[], [])
  | split (h1::h2::t) =
    let 
      val (l1, l2) = (split t) in 
      (h1::l1, h2::l2)
    end;