function [y,y2,y3,ocorreu]=janelamentoedft(sinal,sinal2,sinal3,coefjanela)
%sinal é o sinal já reamostrado e filtrado
%coefjanela são os coeficientes da janelas
%para usar a função recomendase [matriz;ocorrencia]
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
N_window = 133;
M = ones(1,N_window);
window = window_hanning(M);
signal_dft = sinal(posicao:posicao+132);
sinalparadft=window.*signal_dft'; %multipliquei minha janela com a parte do sinal que vou analisar 
Y=fft(sinalparadft);%apliquei a dft
L=132;
P2=abs(Y/L);%aqui e abaixo são conversões para apresentação do gráfico da DFT em frequência
P1=P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = 8000*(0:(L/2))/L;
plot(f,P1);
ocorreu=posicao/8000;
y=sinal(posicao+2*133:posicao+3*133);
y2=sinal2(posicao+2*133:posicao+3*133);
y3=sinal3(posicao+2*133:posicao+3*133);
    end
    end
end
end