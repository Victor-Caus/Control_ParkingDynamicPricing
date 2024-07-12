function controlador = projetarControladorAnalitico(requisitos, planta)
% controlador = projetarControladorCorrenteAnalitico(requisitos, planta)
% projeta o controlador de corrente atraves de um metodo analitico. A
% struct requisitos eh:
% requisitos.wb: requisito de banda passante.
% requisitos.GM: requisito de margem de ganho.
% requisitos.PM: requisito de margem de fase.
% requisitos.fs: requisito de taxa de amostragem.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().
% A saida da funcao eh a struct controlador:
% controlador.K: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% controlador.Tl: parametro Tl da compensacao lead.
% controlador.T: periodo de amostragem do controlador de corrente.

xi = requisitos.xi_2ordem;
wn = requisitos.wb/sqrt(1 - 2*xi^2 + sqrt(4*xi^4 - 4*xi^2+2));
a = planta.a;
f = 4/requisitos.Ts;

syms x;
controlador.Kp = double(solve(2*xi*wn - (f + x*f*a - wn^2*(1-x*a)/f )/(1-x*a), x));
controlador.Ki = wn^2*(1 - controlador.Kp*a)/(a*f);

Kp = controlador.Kp;
Ki = controlador.Ki;
s = tf('s');
Gf = (Ki*f*a/(1-Kp*a))/(s^2 + s*(f + Kp*f*a - Ki*a)/(1-Kp*a) + (Ki*a*f)/(1-Kp*a))
step(Gf);
Ga = minreal(Gf/(1-Gf));
%margin(Ga);
end