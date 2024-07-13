function avaliarControladorAnalDiscretizado(controlador, planta)
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

tf = 2*pi*10^7;

Nr.time = [0; tf];
Nr.signals.values = [0.8; 0.8];
Nr.signals.dimensions = 1;

% Configurando as variaveis usadas no Simulink
assignin('base', 'tf', tf);
assignin('base', 'Nr', Nr);
assignin('base', 'controlador', controlador);
assignin('base', 'planta', planta);

out = sim('plantaestacionamento.slx');

figure;
plot(out.N.time, out.N.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('N', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -dpng -r400 degrau_thetal.png % para usuarios de Word
% print -depsc2 degrau_thetal.eps % para usuarios de LaTeX

figure;
plot(out.N1.time, out.N1.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('N1', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -dpng -r400 degrau_thetam.png % para usuarios de Word
% print -depsc2 degrau_thetam.eps % para usuarios de LaTeX

figure;
plot(out.preco.time, out.preco.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('preco', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -dpng -r400 degrau_wl.png % para usuarios de Word
% print -depsc2 degrau_wl.eps % para usuarios de LaTeX

figure;
plot(out.ic.time, out.ic.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('i_c (A)', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -dpng -r400 degrau_ic.png % para usuarios de Word
% print -depsc2 degrau_ic.eps % para usuarios de LaTeX

figure;
plot(out.i.time, out.i.signals.values, 'LineWidth', 2);
xlabel('Tempo (s)', 'FontSize', 14);
ylabel('i (A)', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -dpng -r400 degrau_i.png % para usuarios de Word
% print -depsc2 degrau_i.eps % para usuarios de LaTeX


end