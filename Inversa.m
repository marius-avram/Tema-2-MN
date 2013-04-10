function invA = Inversa (A)
%functia de obtinere a inversei
[Q R]=factQR(A);                      %descompunem matricea in A=Q*R 
Q=Q';                                 %inversa lui Q=Q'
[n m]=size(R); 
invA=zeros(n,n);  
  for i=1:n 
    invA(1:n,i)=RezST( R, Q(1:n,i));  %pentru fiecare coloana rezolvam sistemul
                                      %superior triunghiular 
  endfor

endfunction 
