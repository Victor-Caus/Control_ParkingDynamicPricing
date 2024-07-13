function requisitos = obterRequisitos()
% requistos = obterRequisitos() obtem os requisitos

requisitos.PM = 120;
requisitos.GM = 20;
Tb = 86400*30;
requisitos.wb = 2*pi./Tb;
end