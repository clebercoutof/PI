function fault_type_clark = fault_identifier_clark(Izero,Ialfa,Ibeta,margin)
if(Izero == 0)%Valor m�ximo da componente Ialfa � maior que o da componente Izero
    fault_type_clark ='Falta Trifasica'; %Falta monof�sica
elseif abs(Izero) < margin && abs(Ialfa) < margin%Valor m�nimo para ser considerado pouco, devido a simul�o
    fault_type_clark ='Falta fase-fase'; %Falta bif�sica
elseif Ibeta > 0
    fault_type_clark ='Falta Bifasica com terra';
else
    fault_type_clark = 'Falta Monofasica';
end