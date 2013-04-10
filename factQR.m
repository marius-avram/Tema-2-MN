function [Q R] = factQR(A)
%factorizarea QR dupa algoritmul Gram Schmidt
[n m]=size(A);
Q=zeros(n);
R=zeros(n); 
R(1,1)=norm(A(1:n,1));     %calculare R(1,1)
Q(1:n,1)=A(1:n,1)/R(1,1);  %calculare vector coloana Q1

 %aplicam formulele pentru intreaga matrice
   for i=2:n 
     suma=0;
      for k=1:i-1 
         R(k,i)=(Q(1:n,k))'*A(1:n,i);
         suma=suma+Q(1:n,k)*R(k,i); 
      endfor
     R(i,i)=norm(A(1:n,i)-suma);
     Q(1:n,i)=(A(1:n,i)-suma)/R(i,i);
   endfor
 
endfunction
