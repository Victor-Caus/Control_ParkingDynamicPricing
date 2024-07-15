function avaliarControladorAnalitico(controlador, planta)
% avaliarControladorAnalitico(controlador, planta)
% Dado o controlador e a planta, plota gráficos que avaliam os requisitos,
% isto é: margem de ganho, margem de fase, banda passante.
% controlador.Ki: ganho integral
% controlador.Kp: ganho proporcional
% planta.a e planta.b: constantes da reta (ax + b) que descrevem a demanda
% em função do preço.

s = tf('s');

% PI
C = controlador.Ki/s + controlador.Kp;

tau = controlador.T/2;
delay = exp(-tau*s); % zero-hold representado como atraso de T/2

Ga = C * delay * (-planta.a);
Gf = minreal(feedback(Ga,1));
figure
margin(Ga);
figure;
step(Gf);
wb = bandwidth(Gf)

end