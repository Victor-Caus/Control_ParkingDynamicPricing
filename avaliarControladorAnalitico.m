clear
planta = obterPlantaProjeto();
s = tf('s');
% PI

Kp = 0.7598;
Ki = 1.46613e-5;
tau = 86400/2;
C = Ki/s + Kp;
% Lag
%alpha = 30;
%T = 86400*100;
%K = 1.5;
%C = K*alpha*(T*s+1)/(alpha*T*s+1);

delay = exp(-tau*s);
%[num, den] = pade(tau, 1);
%delay = tf(num, den);

Ga = C * delay * (-planta.a);
Gf = minreal(feedback(Ga,1));
figure
margin(Ga);
figure;
step(Gf);
bandwidth(Gf)
