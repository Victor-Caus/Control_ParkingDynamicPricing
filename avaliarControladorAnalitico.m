clear
planta = obterPlanta();
s = tf('s');

% PI
Kp = 0.080712377087133;
Ki = 7.750471506277099e-06;
tau = 86400/2;
C = Ki/s + Kp;

delay = exp(-tau*s); % zero-hold representado como atraso de T/2

Ga = C * delay * (-planta.a);
Gf = minreal(feedback(Ga,1));
figure
margin(Ga);
figure;
step(Gf);
bandwidth(Gf)
