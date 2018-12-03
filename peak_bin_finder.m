function [peak_bin,fase,icc_transient,current_fault_list] = peak_bin_finder(s_1,s_2,s_3,nominal_current)
%Peak_bin - amostra onde foi detectado o curto primeiro
%phase - fase onde o curto foi detectado primeiro
%icc_transient = corrente onde o curto foi detectado primeiramente
%current_fault_list = lista contendo as correntes que não tem falta zeradas
duration = length(s_1);
fase = 0;
current_list = [s_1,s_2,s_3];
current_fault_list = [s_1,s_2,s_3];
peak_list =[]; %list containing the peaks
%Search for peak in all vectors
found_a = 0;
%checa se teve algum valor maximo
if abs(max(s_1))>nominal_current
    %procura o valor maximo maior da corrente nominal
    for i = 1:duration
            current = abs(s_1(i));
            if current >= nominal_current
                peak_list(length(peak_list)+1) = i;
                found_a = 1;
                break
            end
    end
end
%zera caso não encontre
if found_a == 0
    peak_list(length(peak_list)+1) = 9999;
    current_fault_list(:,1) = 0;
end

found_b = 0;
if abs(max(s_2))>nominal_current
    for i = 1:duration
            current = abs(s_2(i));
            if current >= nominal_current
                peak_list(length(peak_list)+1) = i;
                found_b = 1;
                break
            end
    end
end
if found_b == 0
    peak_list(length(peak_list)+1) = 9999;
    current_fault_list(:,2) = 0;
end
found_c = 0;
if abs(max(s_3))>nominal_current
    for i = 1:duration
        if found_c == 0
            current = abs(s_3(i));
            if current >= nominal_current
                peak_list(length(peak_list)+1) = i;
                found_c = 1;
                break
            end
        end
    end
end
if found_c == 0
    peak_list(length(peak_list)+1) = 9999;
    current_fault_list(:,3) = 0;
end
peak_bin = min(peak_list);
%usa como referencia a corrente que foi detectada primeiro
for i =(1:length(peak_list))
    if peak_list(i) == peak_bin
        icc_transient = current_list(:,i);
        fase = i;
    end
end