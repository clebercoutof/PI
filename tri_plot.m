function tri_plot(t,s1,s2,s3)
    hold on
    plot(t,s1,'r'); %plota o sinal em vermelho
    plot(t,s2,'g'); %plota o sinal em azul
    plot(t,s3,'b') %plota o sinal em verde
    title('Fases A/B/C nas cores r/g/b');
    hold off
end