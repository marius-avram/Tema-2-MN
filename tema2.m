function tema2 ( nfisier, d, eps) 

%functia face un clasament al pagilor in functie de Pagerank si afiseaza 
%rezultatele intr-un fisier 
%valoarea paramentrilor d=0.85 eps=0.001

fisier=fopen(nfisier,'r'); 
pag=fscanf(fisier,'%i',1); 
frewind(fisier); 

nfisier_out=strcat(nfisier,'.out'); 
fisier_out=fopen(nfisier_out,'w'); 
fprintf(fisier_out,'%i \n',pag);
 
PR1=Iterative(nfisier,d,eps);   %se apeleaza prima functie, iterativa
fprintf(fisier_out,'%7.6f \n', PR1); 
fprintf(fisier_out,'\n'); 

PR2=Algebraic(nfisier,d);      %se apeleaza a doua functie, algebrica
fprintf(fisier_out,'%7.6f \n', PR2); 
fprintf(fisier_out,'\n'); 
 
 for k=1:pag+1               %citim toate liniile pana la ultimele valori
  fgets(fisier);
 endfor

val1=fscanf(fisier,'%f',1);
val2=fscanf(fisier,'%f',1); 

 %vom face doar o sortare a indicilor 

n=pag; 
PR2=PR2(:);
indice=[1:n];

   for i=1:n-1
    
       for j=i+1:n
         if (PR2(indice(i))<PR2(indice(j)))
          aux=indice(i); 
          indice(i)=indice(j);
          indice(j)=aux;
         endif
       endfor 

   endfor
   
  %Se face afisarea 
  for i=1:n 
    fprintf(fisier_out,'%-2i ', i);
    fprintf(fisier_out,'%-2i ', indice(i));
    pr=PR2(indice(i));                %retinem Pagerankingul paginii curente 
    if (pr<val1)                      %aplicam functia membru 
     rez=0;
    elseif (pr>val2) 
     rez=1;
    else 
     a=1/(val2-val1);         %In cazul in care functia apartine [val1,val2] 
     b=-a*val1;		      %aflam a si b pentru a putea calcula u(x)
     rez=a*pr+b;
    endif 
    fprintf(fisier_out,'%7.6f \n', rez );  %Afisam rezultatul
  endfor

fclose(fisier);
fclose(fisier_out);
printf('Toate informatiile au fost scrise in fisierul %s\n',nfisier_out);

endfunction 
