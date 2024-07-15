function requisitos = obterRequisitos()
% requistos = obterRequisitos() obtem os requisitos
% requisitos.PM: margem de fase
% requisitos.GM: margem de ganho
% requisitos.T: período de amostragem
% requisitos.wb: banda passante
requisitos.PM = 120;
requisitos.GM = 20;
requisitos.T = 3600 * 24;
Tb = requisitos.T*30;
requisitos.wb = 2*pi./Tb;
end