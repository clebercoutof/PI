clc;
clear all;
load('1f.mat')
%Verificando o pico das correntes e aproximando 
MAXia=max(Ia);
MAXib=max(Ib);
MAXic=max(Ic);
if(abs(MAXia-MAXic)<=10) %Se houver uma diferença de 10A, considere como ondas iguais.
    MAXic=MAXia;
end
    if(abs(MAXib-MAXic)<=10)
    MAXib=MAXic;
    end
      if(abs(MAXib-MAXia)<=10)
    MAXia=MAXib;
      end
 IMAX=[MAXia MAXib MAXic]; 
 
 
%Verificando o pico das tensões e aproximando 
MAXva=max(Va);
MAXvb=max(Vb);
MAXvc=max(Vc);
if(abs(MAXva-MAXvc)<=1*10^4) %Se houver uma diferença de 10kV, desconsidere.
    MAXvc=MAXva;
end
    if(abs(MAXvb-MAXvc)<=1*10^4)
    MAXvb=MAXvc;
    end
      if(abs(MAXvb-MAXva)<=1*10^4)
    MAXva=MAXvb;
      end
    
%Identificando em quais       