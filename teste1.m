function [y,y2,y3,ocorreu]=teste1(sinal,sinal2,sinal3)
%sinal é o sinal já reamostrado e filtrado
%para usar a função recomendase [matriz;ocorrencia]
sinaldeparada=0;
for i=1:60:2400
    if (sinaldeparada==0)
    valormax=max(abs(sinal(i:i+60)));
    if (valormax>155||valormax<145)
        sinaldeparada=1;
        for n=i:i+60
            if (sinal(n)==valormax)
                posicao=n;
            end
        end   
ocorreu=posicao;
y=sinal(posicao+2*133:posicao+3*133);
y2=sinal2(posicao+2*133:posicao+3*133);
y3=sinal3(posicao+2*133:posicao+3*133);
    end
    end
end
end