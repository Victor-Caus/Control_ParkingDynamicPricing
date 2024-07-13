clear
planta = obterPlantaProjeto();
s = tf('s');
% PI
Ki = 2.3289e-6;
Kp = 1;
tau = 86400/2;
C = Ki/s + Kp;
% Lag
alpha = 1.5;
T = 86400*30;
K = 0.5;
C = K*alpha*(T*s+1)/(alpha*T*s+1);

delay = exp(-tau*s);
%[num, den] = pade(tau, 1);
%delay = tf(num, den);

Ga = C * delay * (-planta.a);
Gf = minreal(feedback(Ga,1));
margin(Ga);