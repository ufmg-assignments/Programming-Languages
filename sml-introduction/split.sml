fun separadorDePalavra c = Char.isSpace c orelse c = #"." orelse c = #"," orelse c = #"-"
val split = String.tokens separadorDePalavra;