
(* Complex number a+bi is represented using a real part a, 
   and an imaginary part b under standard coordinates. It can 
   also be represented as (r, theta) under polar coordinates, where
   r = sqrt(a^2+b^2) and theta = atan2(b, a).
*)
abst@ype complex = $extype "double complex"

(* Given a and b, this function returns complex number representing a+bi *)
fun cmake (double, double): complex = "mac#"

(* Given c=a+bi, this function returns a *)
fun creal (complex): double = "mac#"

(* Given c=a+bi, this function returns b *)
fun cimag (complex): double = "mac#"

(* Given c=a+bi, this function returns theta in radian under the polar coordinates *)
fun carg  (complex): double = "mac#"

(* Not used in this quiz *)
fun cproj (complex): complex = "mac#"

(* Complex number addition, substraction, and multiplication *)
fun cadd (complex, complex): complex = "mac#"
fun cminus (complex, complex): complex = "mac#"
fun cmult (complex, complex): complex = "mac#"

(* Complex number equality test *)
fun ceq (complex, complex): bool

(* Convert to polar coordinate representation @(r, theta) *)
fun ctopolar (complex): @(double, double) 
(* Convert from polar coordinate representation r, theta *)
fun cfrompolar (double, double): complex  

(* Print a complex number *)
fun print_complex (complex): void