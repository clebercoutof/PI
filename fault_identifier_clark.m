function fault_identifier_clark(Izero,Ialfa,Ibeta)

if(Ibeta == 0)&(max(Ialfa) > max(Izero))%Valor m�ximo da componente Ialfa � maior que o da componente Izero
    ClarkFmonofase=1 %Falta monof�sica
    ClarkFbifase=0
    ClarkFtrifase=0 
else
    ClarkFmonofase=0
    ClarkFbifase=0
    ClarkFtrifase=1
if(max(Izero>100))&((max(Ialfa))>(max(Ibeta)))%Valor m�ximo da componente Ialfa � maior que o da componente Ibeta
    ClarkFmonofase=0
    ClarkFbifase=1 %Falta bif�sica
    ClarkFtrifase=0
else
    ClarkFmonofase=0
    ClarkFbifase=0
    ClarkFtrifase=1
   

    end
fault_type_clark =