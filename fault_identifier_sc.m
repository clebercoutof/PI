function fault_type = fault_identifier_sc(I0,I1,I2)
%An�lise de curto-circuito via componentes sim�tricas
mag_sum = round(abs(I1+I2),2);
mag_I1 = abs(round(I1,2));
mag_I2 = abs(round(I2,2));

if I0 == mag_I1 & mag_I1 == mag_I2
    fault_type = 'Falta monofasica'
    

if(I0 == I1)&(I1 == I2) %Componentes iguais
    Fmonofase=1 %Falta monof�sica
    Fbifase=0
    Ftrifase=0
else
    Fmonofase=0
    Fbifase=0
    Ftrifase=1
if(max(I0)>100)&(imag(max(I1)) == -imag(max(I2)))%Componentes com m�dulos iguais mas inversas
    Fmonofase=0
    Fbifase=1   %Falta bif�sica
    Ftrifase=0
else
    Fmonofase=0
    Fbifase=0
    Ftrifase=1

end
end
end