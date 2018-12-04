function fault_type_clark = fault_identifier_clark(Izero,Ialfa,Ibeta)

if(Ibeta == 0)&(Ialfa > max(Izero))%Valor máximo da componente Ialfa é maior que o da componente Izero
    fault_type_clark ='Falta Monofásica'= %Falta monofásica
end
if(max(Izero>100))&(iAlfa)>(max(Ibeta))%Valor máximo da componente Ialfa é maior que o da componente Ibeta
    fault_type_clark ='Falta Bifásica' %Falta bifásica
if
    fault_type_clark ='Falta Trifasica'
    ClarkFtrifase=1
end
fault_type_clark = 0