function fault_type_clark = fault_identifier_clark(Izero,Ialfa,Ibeta)

if(Ibeta == 0)&(Ialfa > max(Izero))%Valor m�ximo da componente Ialfa � maior que o da componente Izero
    fault_type_clark ='Falta Monof�sica'= %Falta monof�sica
end
if(max(Izero>100))&(iAlfa)>(max(Ibeta))%Valor m�ximo da componente Ialfa � maior que o da componente Ibeta
    fault_type_clark ='Falta Bif�sica' %Falta bif�sica
if
    fault_type_clark ='Falta Trifasica'
    ClarkFtrifase=1
end
fault_type_clark = 0