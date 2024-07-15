function avaliarControladorAnalitico(controlador, planta)
% avaliarControladorAnalitico(controlador, planta)

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