load('fase-fase Inicio da linha') %Carrega arquivo da simula��o
raw_signal_a= iX0026aX0001a; %sinal da fase a
raw_signal_b = iX0026bX0001b; %sinal da fase b
raw_signal_c = iX0026cX0001c; %sinal da fase c

%raw_signal_a = Ia;
%raw_signal_b = Ib;
%raw_signal_c = Ic;
nominal_current = 170;
f_signal = 60;
fs_raw = 1000000; %frequencia de amostragem do ATPDRAW
fs = 8000; %frequencia de amostragem do rele
%Faz o resample dos sinais para a frequencia especificada
[ia,ib,ic] = tri_resample(fs,fs_raw,raw_signal_a,raw_signal_b,raw_signal_c);
%[ia,ib,ic] = tri_filter(ia,ib,ic);
phase_currents = [ia,ib,ic]; %correntes de fase
%Cria o vetor de tempo para o plot e encontra o tamanho do sinal
[t,length]= time_vec(ia,fs);
%Plota as 3 fazes - fase a: vermelho / fase b: azul / fase c: verde
tri_plot(t,ia,ib,ic);
%Encontra o bin onde ocorre o curto
[peak_bin,fase,icc_transient,current_fault_list] = peak_bin_finder(ia,ib,ic,nominal_current);

number_of_cycles = 2;%Faz an�lise spectral do sinal para N ciclos
%dft_transients(icc_transient,f_signal,fs,peak_bin,number_of_cycles);

%[v012] = fasor2comp_sim(current_fault_list,f_signal,fs,peak_bin,number_of_cycles);
[I0,I1,I2] = sym_comp(current_fault_list,fase,f_signal,fs,number_of_cycles,peak_bin);
fault_type = fault_identifier_sc(I0,I1,I2);


%[y,y2,y3,ocorreu]=teste1(ia,ib,ic); 

%ipt = findchangepts(ic,'Statistic','rms','MinThreshold',50);
%tempo = time_step*ocorreu;