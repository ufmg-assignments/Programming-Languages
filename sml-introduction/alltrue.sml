fun allTrue ([] : bool list) = false
  | allTrue (h::[]) = h orelse allTrue([])
  | allTrue (h::t) = h andalso allTrue(t);