function [tipo,ocorreu]=tipodecarga(sinal,biir,aiir,coefjanela)
%sinal é o sinal já reamostrado e filtrado
%coefjanela são os coeficientes da janelas
%para usar a função recomendase [matriz;ocorrencia]
%se tipo=1 a carga é resistiva
%se tipo=2 a carga é indutiva
%se tipo=3 a carga é capacitiva
reamostragem=decimate(sinal,125);%aqui eu reamostro 1MHz em 1MHz/125
sinal=filter(biir,aiir,reamostragem);%aplico o filtro ao sinal reamostrado
sinaldeparada=0;
for i=1:60:2400
    if (sinaldeparada==0)
    valormax=max(sinal(i:i+60));
    if (valormax>613||valormax<600)
        sinaldeparada=1;
        for n=i:i+60
            if (sinal(n)==valormax)
                posicao=n;
            end
        end   
sinalparadft=coefjanela.*sinal(posicao:posicao+799); %multipliquei minha janela com a parte do sinal que vou analisar 
Y=fft(sinalparadft);%apliquei a dft
L=800;
P2=abs(Y/L);%aqui e abaixo são conversões para apresentação do gráfico da DFT em frequência
P1=P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = 8000*(0:(L/2))/L;
plot(f,P1);
ocorreu=posicao/8000;
determ=max(P1);
for n=1:length(P1)
    if P1(n)==determ
                detp=n;
            end
end   
        if detp==7
            if P1(40)<0.5
tipo=1
            else
                tipo=3
            end
        else
            tipo=2
    end
    end
    end
end
end