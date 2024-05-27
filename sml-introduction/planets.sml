datatype Planeta  = Mercurio | Venus | Terra | Marte | Jupiter | Saturno | Urano | Netuno;

fun planetAge (x, Mercurio) = x div 12 *  88
  | planetAge (x, Venus) = x div 12 * 225
  | planetAge (x, Terra) = x div 12 * 365
  | planetAge (x, Marte) = x div 12 * 687
  | planetAge (x, Jupiter) = x div 12 * 4332
  | planetAge (x, Saturno) = x div 12 * 10760
  | planetAge (x, Urano) = x div 12 * 30681
  | planetAge (x, Netuno) = x div 12 * 60190;