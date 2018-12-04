function fault_type_clark = fault_identifier_clark(Izero,Ialfa,Ibeta,margin)
if(Izero == 0)%Valor máximo da componente Ialfa é maior que o da componente Izero
    fault_type_clark ='Falta Trifasica'; %Falta monofásica
elseif abs(Izero) < margin && abs(Ialfa) < margin%Valor mínimo para ser considerado pouco, devido a simulão
    fault_type_clark ='Falta fase-fase'; %Falta bifásica
elseif Ibeta > 0
    fault_type_clark ='Falta Bifasica com terra';
else
    fault_type_clark = 'Falta Monofasica';
end