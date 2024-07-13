function ftd = discretizarControladorPreco(controlador)
% ftd = discretizarControladorPosicao(controlador) discretiza o controlador
% de corrente. A struct controlador eh dada por:
% controlador.Kp: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% controlador.T: periodo de amostragem do controlador de corrente.
% A saida ftd eh a funcao de transferencia discreta (no dominio z) do
% controlador de corrente.

Kp = controlador.Kp;
Ki = controlador.Ki;
T = controlador.T;
% Implementar
s = tf('s');

C = Kp + Ki*s;
ftd = c2d(C, T, 'Tustin');

end