function avaliarControladorSimulacao(controlador, planta, Tf)
% simularRespostaDegrau(controlador, planta) simula degrau unitário (caso
% real do precificador). A struct controlador eh dada por:
% Tf = Tempo final da simulação
% controlador.Ki: ganho integral
% controlador.Kp: ganho proporcional
% controlador.T: tempo de amostragem
% planta.a e planta.b: constantes da reta (ax + b) que descrevem a demanda
% em função do preço.
% A struct planta contem os parametros da planta e pode ser obtida atraves
% de planta = obterPlanta().

Nr.time = [0; Tf];
Nr.signals.values = [0.7; 0.7];
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
xlabel('Time (s)', 'FontSize', 14);
ylabel('N', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -depsc2 out_N.eps % para usuarios de LaTeX

figure;
plot(out.N_linear.time, out.N_linear.signals.values, 'LineWidth', 2);
xlabel('Time (s)', 'FontSize', 14);
ylabel('N linear', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -depsc2 out_N_linear.eps % para usuarios de LaTeX

figure;
plot(out.preco.time, out.preco.signals.values, 'LineWidth', 2);
xlabel('Time (s)', 'FontSize', 14);
ylabel('Hourly rate ($)', 'FontSize', 14);
set(gca, 'FontSize', 14);
grid on;
print -depsc2 out_preco.eps % para usuarios de LaTeX

end