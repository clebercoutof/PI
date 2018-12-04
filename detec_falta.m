load('Meio_fase-fase') % Carrega arquivo da simulação

%Faltas no meio da linha
raw_signal_a= iX0033aX0001a; % Sinal da fase a
raw_signal_b = iX0033bX0001b; % Sinal da fase b
raw_signal_c = iX0033cX0001c; % Sinal da fase c

%Faltas no inicio da linha
%raw_signal_a= iX0026aX0001a; % Sinal da fase a
%raw_signal_b = iX0026bX0001b; % Sinal da fase b
%raw_signal_c = iX0026cX0001c; % Sinal da fase c

nominal_current = 165; % Corrente nominal do circuito
f_signal = 60; % Frequenciad o Sinal
fs_raw = 1000000; % Frequencia de amostragem do ATPDRAW
fs = 8000; % Frequencia de amostragem do rele
% Faz o resample dos sinais para a frequencia especificada
[ia,ib,ic] = tri_resample(fs,fs_raw,raw_signal_a,raw_signal_b,raw_signal_c);
% Cria o vetor de tempo para o plot e encontra o tamanho do sinal
[t,length]= time_vec(ia,fs);
% Plota as 3 fazes - fase a: vermelho / fase b: azul / fase c: verde
tri_plot(t,ia,ib,ic);
% Encontra o bin onde ocorre o curto
[peak_bin,fase,icc_transient,current_fault_list] = peak_bin_finder(ia,ib,ic,nominal_current);
number_of_cycles = 2; %Número de ciclos pos curto para análise
%dft_transients(icc_transient,f_signal,fs,peak_bin,number_of_cycles);
%calculo das componentes simetricas
[I0,I1,I2] = sym_comp(current_fault_list,fase,f_signal,fs,number_of_cycles,peak_bin);
margem_sc = 10;%Margem aceitavel para falta fase-fase
fault_type = fault_identifier_sc(I0,I1,I2,margem_sc) %Cria variavel com o tipo da falta
%Calcula as transformadas de Clark
margem_clarke = 6;
[Izero,Ialfa,Ibeta] = clark_comp(current_fault_list,fase,f_signal,fs,number_of_cycles,peak_bin);
fault_type_clark = fault_identifier_clark(Izero,Ialfa,Ibeta,margem_clarke)%Cria variavel com o tipo da falta
