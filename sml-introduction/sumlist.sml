fun sumLists ([],[]) = []
  | sumLists (x, y) = (hd x+ hd y)::sumLists(tl x, tl y);