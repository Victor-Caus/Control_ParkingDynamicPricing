function controlador = discretizarControladorPreco(controlador, T)
% ftd = discretizarControladorPosicao(controlador) discretiza o controlador
% de corrente. A struct controlador eh dada por:
% controlador.Kp: ganho proporcional do controlador de corrente.
% controlador.alpha: parametro alpha da compensacao lead.
% T: periodo de amostragem do controlador de corrente.
% A saida ftd eh a funcao de transferencia discreta (no dominio z) do
% controlador de corrente.

s = tf('s');

C = controlador.Kp + controlador.Ki/s;
controlador.ftd = c2d(C, T, 'Tustin');
end