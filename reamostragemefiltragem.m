function y=reamostragemefiltragem(sinal,biir,aiir)
%sinal é o sinal a ser reamostrado e filtrado
%biir e aiir são os coeficientes do filtro
reamostragem=decimate(sinal,125);%aqui eu reamostro 1MHz em 1MHz/125
y=filter(biir,aiir,reamostragem);%aplico o filtro ao sinal reamostrado
end