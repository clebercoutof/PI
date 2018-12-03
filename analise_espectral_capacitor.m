%load Banco_de_Capacitores.MAT
%load Inicio_Mono.MAT

raw_signal_cap_a = iX0035aX0036a;
raw_signal_cap_b = iX0035bX0036b;
raw_signal_cap_c = iX0035cX0036c;

raw_signal_mono_a= iX0026aX0001a;
raw_signal_mono_b = iX0026bX0001b;
raw_signal_mono_c = iX0026cX0001c;

fs_raw = 1000000;
fs = 18000;
signal_cap_a = resample(raw_signal_cap_a,fs,fs_raw);
signal_cap_b = resample(raw_signal_cap_b,fs,fs_raw);
signal_cap_c = resample(raw_signal_cap_c,fs,fs_raw);

signal_res_a = resample(raw_signal_mono_a,fs,fs_raw);
signal_res_b = resample(raw_signal_mono_b,fs,fs_raw);
signal_res_c = resample(raw_signal_mono_c,fs,fs_raw);

size = length(signal_cap_a);
t = 0:1/fs:(9000*1/fs); %criação do vetor de tempo
hold on
%plot(t(1:1800),signal_cap_a(1:1800)); %plota o sinal
%plot(t(1:1800),signal_cap_a(1800:3600)); %plota o sinal


%o capacitor entra em 0,1 segundos, logo nos primeiros 1800 pontos
delta_f = 20
N_cap = fs/delta_f
signal_befor_cap = signal_cap_a(1:N_cap);
plot(signal_befor_cap)

signal_after_cap = signal_cap_a(4000:4000+N_cap);
plot(signal_after_cap)

fft_befor = fft(signal_befor_cap,N_cap);
fft_after = fft(signal_after_cap,N_cap);

%hold off
%stem(2*abs(fft(signal_befor_cap))/N_cap)
%stem(2*abs(fft(signal_after_cap))/N_cap)


l=log2(size);
p=ceil(l);  
N = 2^p;
delta_f = fs/N;
%fft_cap = fft(signal_cap);
%fft_res = fft(signal_res);

%hold on
%stem(2*abs(fft_cap)/N)
%stem(2*abs(fft_res)/N)