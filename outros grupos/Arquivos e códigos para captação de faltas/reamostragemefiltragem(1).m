function [y,y2,y3]=reamostragemefiltragem(sinal,sinal2,sinal3,biir,aiir)
%sinal é o sinal a ser reamostrado e filtrado
%biir e aiir são os coeficientes do filtro
reamostragem=decimate(sinal,125);%aqui eu reamostro 1MHz em 1MHz/125
y=filter(biir,aiir,reamostragem);%aplico o filtro ao sinal reamostrado
reamostragem2=decimate(sinal2,125);%aqui eu reamostro 1MHz em 1MHz/125
y2=filter(biir,aiir,reamostragem2);%aplico o filtro ao sinal reamostrado
reamostragem3=decimate(sinal3,125);%aqui eu reamostro 1MHz em 1MHz/125
y3=filter(biir,aiir,reamostragem3);%aplico o filtro ao sinal reamostrado
end