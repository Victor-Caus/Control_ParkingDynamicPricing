function controlador = discretizarControladorPreco()
% ftd = discretizarControladorPosicao(controlador) discretiza o controlador
% de corrente. A struct controlador eh dada por:
% controlador.Kp: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% controlador.T: periodo de amostragem do controlador de corrente.
% A saida ftd eh a funcao de transferencia discreta (no dominio z) do
% controlador de corrente.

Kp = 0.01;%controlador.Kp;
Ki = 2.33e-1;%controlador.Ki;
T = 86400;
% Implementar
s = tf('s');

C = Kp + Ki/s;
controlador.ftd = c2d(C, T, 'Tustin');
controlador.T = T;
end