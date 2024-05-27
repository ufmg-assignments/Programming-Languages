datatype btree = Leaf | Node of (btree * int * btree);

fun sumAll (Leaf) = 0
  | sumAll (Node (b1, x, b2)) = x + sumAll(b1) + sumAll(b2);