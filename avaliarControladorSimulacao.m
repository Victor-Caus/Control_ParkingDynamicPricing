function avaliarControladorSimulacao(controlador, planta, Tf)
% simularRespostaDegrau(controlador, planta) simula a resposta ao degrau
% unitario do servomotor de posicao. A struct controlador eh dada por:
% controlador.posicao.Kp: ganho proporcional do controlador de posicao.
% controlador.posicao.Kd: ganho derivativo do controlador de posicao.
% controlador.posicao.a: frequencia de corte do filtro do termo derivativo.
% controlador.posicao.T: periodo de amostragem do controlador de posicao.
% controlador.posicao.ftd: funcao de transferencia discreta do controlador
%                          de posicao.
% controlador.corrente.K: ganho proporcional do controlador de corrente.
% controlador.corrente.alpha: parametro alpha da compensacao lead.
% controlador.corrente.Tl: parametro Tl da compensacao lead.
% controlador.corrente.T: tempo de amostragem do controlador de corrente.
% controlador.corrente.ftd: funcao de transferencia discreta do controlador
%                          de corrente.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlantaServoPosicao().

Nr.time = [0; Tf];
Nr.signals.values = [0.6; 0.6];
Nr.signals.dimensions = 1;

b.time = [0; Tf];
b.signals.values = [planta.b; planta.b];
b.signals.dimensions = 1;

% Configurando as variaveis usadas no Simulink
assignin('base', 'Tf', Tf);
assignin('base', 'Nr', Nr);
assignin('base', 'b', b);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);

out = sim('plantaestacionamento.slx');

figure;
plot(out.N.time, out.N.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('N', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -depsc2 out_N.eps % para usuarios de LaTeX

figure;
plot(out.N_linear.time, out.N_linear.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('N linear', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -depsc2 out_N_linear.eps % para usuarios de LaTeX

figure;
plot(out.preco.time, out.preco.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('preco', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -depsc2 out_preco.eps % para usuarios de LaTeX

end