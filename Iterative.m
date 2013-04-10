function PR=Iterative (nfisier, d, eps)

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
 A;
 K;
 
 M=(inv(K)*A)';
 R1(1:pag,1)=1/pag;      %initializam R(t0)
 R2=zeros(pag,1);         %R anterior lui R(t0) il consideram un vector coloana
			  %umplut cu zerouri
 V1=ones(pag,1);         
  
  while (norm(R1-R2)>=eps)
   R2=R1;                  %actualizam R anterior
   R1=d*M*R1+(1-d)*V1/pag; %aplicam formula   
  endwhile
 
 PR=R1;

fclose(fisier);
 
endfunction 
