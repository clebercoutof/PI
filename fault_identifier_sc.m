function fault_type = fault_identifier_sc(I0,I1,I2,margim)
%Análise de curto-circuito via componentes simétricas
mag_sum_I1_I2 = round(abs(I1+I2),1);
mag_I1 = round(abs(I1),1);
mag_I2 = round(abs(I2),1);

if abs(I0)>0 
    if I0 == mag_I1 && mag_I1 == mag_I2
        fault_type = 'Falta Monofasica';
    else
        fault_type= 'Falta Bifasica com terra';
    end
end
if I0 == 0
    fault_type = 'Falta Trifasica';
end
if mag_sum_I1_I2 < margim
    fault_type = 'Falta fase-fase';
end
end