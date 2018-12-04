function [Izero,Ialfa,Ibeta] = clark_comp(current_fault_list,fase,f_signal,fs,number_of_cycles,peak_bin)
%Calcula a componente simetrica de n ciclos apos o curto, apos um pico
%especificado
signal_cycle = round(fs/f_signal);
number_bins = signal_cycle*number_of_cycles;
signal_a = current_fault_list(peak_bin:peak_bin+number_bins-1,1);
signal_b = current_fault_list(peak_bin:peak_bin+number_bins-1,2);
signal_c = current_fault_list(peak_bin:peak_bin+number_bins-1,3);

switch fase
    case 1
        [x,ponto] = max(signal_a);
    case 2
        [x,ponto] = max(signal_b);
    case 3
        [x,ponto] = max(signal_c);
end

fa = signal_a(ponto);
fb = signal_b(ponto);
fc = signal_c(ponto);
%Recebe a lista com as correntes que não sofreram curto zeradas
Izero=(1/3)*(fa+fb+fc);
Ialfa=(1/3)*((2*fa)-fb-fc);
Ibeta=((fb)-(fc))/(sqrt(3));

Izero = round(Izero,1);
Ialfa = round(Ialfa,1);
Ibeta = round(Ibeta,1);
end