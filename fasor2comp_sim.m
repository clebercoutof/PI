% Converte fasor para creturnsomponentes simetricas
% v012 = fasor2comp_sim(vabc)  symmetrical components in 3-by-2 matric of 
% zero, positive, negative sequence and its respective angle in graus
%
% Entradas
% vabc =    [fase A magnitude, fase A angle(graus);
%            fase B magnitude, fase B angle(graus);
%            fase C magnitude, fase C angle(graus)]
% Saidas
% v012 =    [zero sequence magnitude, zero sequence angle(graus);
%            positive sequence magnitude, positive sequence angle(graus);
%            negative sequence magnitude, negative sequence angle(graus)]
% Dependencias
% NATIVAS DO MATLAB:
% pol2cart
% complex
% angle
% horzcat
function v012 = fasor2comp_sim(current_fault_list,f_signal,fs,peak_bin,number_of_cycles)
    signal_cycle = round(fs/f_signal);
    number_bins = signal_cycle*number_of_cycles;
    
    ia = current_fault_list(peak_bin:peak_bin+number_bins-1,1);
    ib = current_fault_list(peak_bin:peak_bin+number_bins-1,2);
    ic = current_fault_list(peak_bin:peak_bin+number_bins-1,3);
    
    ia_mag = abs(ia);
    ib_mag = abs(ib);
    ic_mag = abs(ic);
    ia_phase = phase(ia);
    ib_phase = phase(ib);
    ic_phase = phase(ic);
    [x, y]=pol2cart((pi*ia_phase)/180,ia_mag);
    pa = complex(x,y);
    [x, y]=pol2cart((pi*ib_phase)/180,ib_mag);
    pb = complex(x,y);
    [x, y]=pol2cart((pi*ic_phase)/180,ic_mag);
    pc = complex(x,y);
    
    a = -0.5+0.866i;
    a2 = -0.5-0.866i;
    A1 = [1 1 1;1 a a2;1 a2 a]/3;
    mag = A1*abs([pa;pb;pc]);
    ang = (angle(A1*[pa;pb;pc])*180)/pi;
    v012 = horzcat(mag, ang);
end