function dft_transients(signal,signal_frequency,fs,peak_bin,number_of_cycles)
%faz a analise espectral do transiente,para um recorte do sinal de n cilocs
%a partir da amostra de pico.
%fs = frequencia de amostragem

%Calcula a quantidade de amostras necessárias para 1 ciclo
signal_cycle = round(fs/signal_frequency); 
%Cria o vetor para a janela
N_window = number_of_cycles*signal_cycle;
M = ones(1,N_window);
window = window_hanning(M); %Cria a janela
%Multiplica o sinal pela janela de duracao n ciclos
signal_cut = signal(peak_bin:peak_bin+N_window-1);
signal_fault = window.*signal_cut';

N = length(signal_fault);%numero de amostras para fft
signal_fft = fft(signal_fault,N); %transformada do sinal
%configurações para plot
P2=2*abs(signal_fft/N);
P1=P2(1:N/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = fs*(0:(N/2))/N;

figure
stem(f,P1);
title('DFT com janela Hanning depois do curto');
signal_pre_fault = fft(window.*signal(1:N)',N); %transformada do sinal
%configurações para plot
X2=2*abs(signal_pre_fault/N);
X1=X2(1:N/2+1);
X1(2:end-1) = 2*X1(2:end-1);
figure
stem(f,X1);

title('DFT com janela Hanning antes do curto');
end