function [I0,I1,I2] = sym_comp(current_fault_list,fase,f_signal,fs,number_of_cycles,peak_bin)
%Calcula a componente simetrica de n ciclos apos o curto, apos um pico
%especificado
signal_cycle = round(fs/f_signal);
number_bins = signal_cycle*number_of_cycles;
signal_a = current_fault_list(peak_bin:peak_bin+number_bins-1,1);
signal_b = current_fault_list(peak_bin:peak_bin+number_bins-1,2);
signal_c = current_fault_list(peak_bin:peak_bin+number_bins-1,3);

switch fase
    case 1
        [fa,ponto] = max(signal_a);
        fb = signal_b(ponto);
        fc = signal_c(ponto);
    case 2
        [fb,ponto] = max(signal_b);
        fa = signal_a(ponto);
        fc = signal_c(ponto);
    case 3
        [fc,ponto] = max(signal_c);
        fa = signal_a(ponto);
        fb = signal_b(ponto);
end
phase_fa = phase(fa);
phase_fb = phase(fb);
phase_fc = phase(fc);

%fa = max_fa;
%fb = max_fb;
%fc = max_fc ;


%Recebe a lista com as correntes que não sofreram curto zeradas
ALFA=-0.5-0.866i;
I0=1/3*(fa+fb+fc);
I1=1/3*(fa+(ALFA*fb)+((ALFA^2)*fc));
I2=1/3*(fa+((ALFA^2)*fb)+(ALFA*fc));

abs_I1 = abs(round(I1,2));
abs_I2 = abs(round(I2,2));
I0 = round(I0,2);
sum_mag = abs_I1 + abs_I2;
mag_sum =round(abs(I1+I2),2);
end