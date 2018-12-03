function fault_identifier_clark(Izero,Ialfa,Ibeta)

if(Ibeta == 0)&(max(Ialfa) > max(Izero))%Valor máximo da componente Ialfa é maior que o da componente Izero
    ClarkFmonofase=1 %Falta monofásica
    ClarkFbifase=0
    ClarkFtrifase=0 
else
    ClarkFmonofase=0
    ClarkFbifase=0
    ClarkFtrifase=1
if(max(Izero>100))&((max(Ialfa))>(max(Ibeta)))%Valor máximo da componente Ialfa é maior que o da componente Ibeta
    ClarkFmonofase=0
    ClarkFbifase=1 %Falta bifásica
    ClarkFtrifase=0
else
    ClarkFmonofase=0
    ClarkFbifase=0
    ClarkFtrifase=1
   

    end
fault_type_clark =