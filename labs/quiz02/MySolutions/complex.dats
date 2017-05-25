#define ATS_DYNLOADFLAG 0

#include "share/atspre_staload.hats"

staload "complex.sats"
staload "libats/libc/SATS/math.sats"
staload _ = "libats/libc/DATS/math.dats"

%{^
#include <complex.h>
double complex cmake (double real, double imag) {return real + imag * I;}
double complex cadd (double complex c1, double complex c2) {return c1 + c2;}
double complex cminus (double complex c1, double complex c2) {return c1 - c2;}
double complex cmult (double complex c1, double complex c2) {return c1 * c2;}
%}

implement ceq (c1, c2) = let 
	val epsilon:double = 0.00001
	val diff = cminus(c1, c2)
in 
	abs(creal(diff)) < epsilon andalso abs(cimag(diff)) < epsilon
end 

implement ctopolar (c) = 
	@(sqrt(creal(c) * creal(c) + cimag(c) * cimag(c)), carg(c))

implement cfrompolar (r, theta) = 
	cmake(r * cos(theta), r * sin(theta))

implement print_complex (c) = let 
	val a = creal c 
	val b = cimag c 
	// a.bi
	val _ = print_double a 
	val _ = print "+"
	val _ = print_double b 
	val _ = print "i"
in 
end 

