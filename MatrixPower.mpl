MatrixPower := proc(A::Matrix,B::Matrix,n := infinity);

size := sqrt(numelems(A));

if sqrt(numelems(B)) <> size then error "Matrices need to be the same size!" else end if;

if n = infinity then return LinearAlgebra[MatrixExponential](B.LinearAlgebra[MatrixFunction](A,ln(x),x));

elif type(n,posint) then return Matrix(size,shape=identity).sum(((B.LinearAlgebra[MatrixFunction](A,ln(x),x))^k)/(k!),k=0..n);

else end if;

end proc;