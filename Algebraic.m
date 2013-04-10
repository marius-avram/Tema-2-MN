function PR = Algebraic (nfisier, d) 

fisier=fopen(nfisier,'r');
pag=fscanf(fisier,'%i', 1);
A=zeros(pag);
K=zeros(pag);
 for i=1:pag
  ord=fscanf(fisier,'%i',1);
  n=fscanf(fisier,'%i',1);
  V=fscanf(fisier,'%i',n);

    V=unique(V);         %eliminam duplicatele
    index=find(V==ord);
    V(index)= [];        %eliminam pagina curenta 
    K(ord,ord)=numel(V); %introducem gradul exterior pe diagonala
    A(ord,V)=1;          %construim matricea de adiacenta  
 endfor

M=(Inversa(K)*A)';           %calculam matriceam M
fclose(fisier); 

I=eye(pag);
I1=ones(pag,1);
Rt=Inversa(I-d*M);       %aplicam functia de aflare a inversului cu ajutorul 
			 %factorizarii QR si rezolvarea sistemului triunghiular
PR=Rt*(1-d)*I1/pag;
 
endfunction 
