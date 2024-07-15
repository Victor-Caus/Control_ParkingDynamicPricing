function requisitos = obterRequisitos()
% requistos = obterRequisitos() obtem os requisitos
% requisitos.PM: margem de fase
% requisitos.GM: margem de ganho
% requisitos.wb: banda passante

requisitos.PM = 120;
requisitos.GM = 30;
Tb = 86400*30;
requisitos.wb = 2*pi./Tb;
end