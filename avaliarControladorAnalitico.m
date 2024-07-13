clear
planta = obterPlantaProjeto();
s = tf('s');
Ki = 2.3289e-6;
Kp = 1;
tau = 86400/2;
C = Ki/s + Kp;
delay = exp(-tau*s);
%[num, den] = pade(tau, 1);
%delay = tf(num, den);
Ga = C * delay * (-planta.a);
Gf = minreal(feedback(Ga,1));
margin(Gf);