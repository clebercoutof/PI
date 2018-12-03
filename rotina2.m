clc;
clear all;
load('filtroNOVO.mat')
load('2ff.mat')
%Valores nominais
inom=612.7491; vnom=3.8243*10^4; 
%Ia = iX0021aX0045a;
%Ib = iX0021bX0045b; 
%Ic = iX0021cX0045c;
%Reamostrando os sinais de corrente
ia=reamostragemefiltragem(Ia,biir,aiir);
ib=reamostragemefiltragem(Ib,biir,aiir);
ic=reamostragemefiltragem(Ic,biir,aiir);

%Ifalta=amplitudescorrente(ia,ib,ic,inom)
[y,y2,y3,ocorreu]=janelamentoedft(ia,ib,ic,aiir); 

%Zerando as fases onde não ocorrem faltas
for i=96:120%Intervalo onde ocorrem as correntes de pico
if(abs(y(i))>(inom))
    fa=y;
else
    fa=0;
end
if(abs(y2(i))>(inom))
    fb=y2;
else
    fb=0; 
end
if(abs(y3(i))>(inom))
    fc=y3;
else
    fc=0;

end
end

%Decompondo em componentes simétricas
ALFA=-0.5-0.866i;
I0=1/3*(fa+fb+fc);
I1=1/3*(fa+(ALFA*fb)+((ALFA^2)*fc));
I2=1/3*(fa+((ALFA^2)*fb)+(ALFA*fc));



%Análise de curto-circuito via componentes simétricas
if(I0 == I1)&(I1 == I2) %Componentes iguais
    Fmonofase=1 %Falta monofásica
    Fbifase=0
    Ftrifase=0
else
    Fmonofase=0
    Fbifase=0
    Ftrifase=1
if(max(I0)>100)&(imag(max(I1)) == -imag(max(I2)))%Componentes com módulos iguais mas inversas
    Fmonofase=0
    Fbifase=1   %Falta bifásica
    Ftrifase=0
else
    Fmonofase=0
    Fbifase=0
    Ftrifase=1


end
end
    

%Decompõe em componentes de clarke
Izero=(1/3)*(fa+fb+fc)
Ialfa=(1/3)*((2*fa)-fb-fc)
Ibeta=((fb)-(fc))/(sqrt(3))


%Análise de curto-circuito via componentes Clarke

if(Ibeta == 0)&(max(Ialfa) > max(Izero))%Valor máximo da componente Ialfa é maior que o da componente Izero
    ClarkFmonofase=1 %Falta monofásica
    ClarkFbifase=0
    ClarkFtrifase=0 
else
    ClarkFmonofase=0
    ClarkFbifase=0
    ClarkFtrifase=1
if(max(Izero>100))&((max(Ialfa))>(max(Ibeta)))%Valor máximo da componente Ialfa é maior que o da componente Ibeta
    ClarkFmonofase=0
    ClarkFbifase=1 %Falta bifásica
    ClarkFtrifase=0
else
    ClarkFmonofase=0
    ClarkFbifase=0
    ClarkFtrifase=1

 end
 end

















