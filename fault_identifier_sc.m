function fault_type = fault_identifier_sc(I0,I1,I2)
%Análise de curto-circuito via componentes simétricas
mag_sum_I1_I2 = round(abs(I1+I2),2);
mag_I1 = abs(round(I1,2));
mag_I2 = abs(round(I2,2));

if abs(I0 > 0)  
    if I0 == mag_I1 & mag_I1 == mag_I2
        fault_type = 'Falta monofasica';
    end
    if real(I1) == -real(I2) % 
        fault_type = 'Falta bifasica';
    end
end
if I0 == 0
    fault_type = 'Falta Trifasica';
end

fault_type = 'not found';
end