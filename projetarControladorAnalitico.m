function controlador = projetarControladorAnalitico(requisitos, planta)
% controlador = projetarControladorCorrenteAnalitico(requisitos, planta)
% projeta o controlador atraves de um metodo analitico. Para observar os 
% gráficos de Ki x Kp, utilize o script graficosControladorAnalitico.m. A
% struct requisitos eh:
% requisitos.wb: requisito de banda passante.
% requisitos.GM: requisito de margem de ganho.
% requisitos.PM: requisito de margem de fase.
% requisitos.fs: requisito de taxa de amostragem.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().
% A saida da funcao eh a struct controlador:
% controlador.K: ganho proporcional do controlador de corrente.
% controlador.Tl: parametro Tl da compensacao lead.
% controlador.T: periodo de amostragem do controlador de corrente.

PM = requisitos.PM;
a = planta.a;
wb = requisitos.wb;

% relação Ki x Kp para PM fixo
Ki1 = @(Kp) (pi/180).*(90 - PM + atand(a^2*Kp.^2./(1 - a.^2*Kp.^2))).*(sqrt((1-a.^2.*Kp.^2)/a.^2));

% relação Ki x Kp para wb fixo
Ki2 = @(Kp) sqrt(2.*wb.^2/a.^2 - (Kp.*wb).^2);

fun = @(Kp) Ki2(Kp) - Ki1(Kp);
x0 = 1;
x = fzero(fun, x0);

controlador.Kp = x;
controlador.Ki = Ki2(x);
controlador.T = 86400;

end