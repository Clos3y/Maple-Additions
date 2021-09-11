MatrixPower := proc(A,B::Matrix,n := infinity);

if type(A,Matrix) then

size := sqrt(numelems(A));

if sqrt(numelems(B)) <> size then error "Matrices need to be the same size!" else end if;

if n = infinity then return LinearAlgebra[MatrixExponential](B.LinearAlgebra[MatrixFunction](A,ln(x),x));

elif type(n,posint) then return Matrix(size,shape=identity).sum(((B.LinearAlgebra[MatrixFunction](A,ln(x),x))^k)/(k!),k=0..n);

else end if;

else 

if n = infinity then return LinearAlgebra[MatrixExponential](B*ln(A));

elif type(n,posint) then return Matrix(size,shape=identity).sum(((B*ln(A))^k)/(k!),k=0..n);

else end if;

end if;

end proc;
