function requisitos = obterRequisitos()
% requistos = obterRequisitos() obtem os requisitos

requisitos.wb = 2 * pi * 10;
requisitos.posicao.GM = 11;
requisitos.posicao.PM = 60;
requisitos.posicao.fs = 1000;

%requisitos.wb = 1.286 * 10^(-7);
requisitos.wb = 1.286 * 10^(-1);
requisitos.xi_2ordem = 0.6;
requisitos.Ts = 86400;
end